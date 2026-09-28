SET preserve_insertion_order = false;

CREATE OR REPLACE TABLE enrichments AS (SELECT * FROM read_json('./**/enrichment/**.json', union_by_name=true, filename = true));
CREATE OR REPLACE TABLE fields AS (SELECT * FROM read_json('./**/field/**.json', union_by_name=true, filename = true));
CREATE OR REPLACE TABLE precomputeds AS (SELECT * FROM read_json('./**/precomputed/**.json', union_by_name=true, filename = true));
CREATE OR REPLACE TABLE subresources AS (SELECT * FROM read_json('./**/subresource/**.json', union_by_name=true, filename = true));

CREATE OR REPLACE VIEW field_format_uage AS (
    WITH preprocessed AS (
        SELECT
            scope,
            format.name AS format_name,
            filename.split('/')[2] AS instance
        FROM
            fields
        WHERE
            format.name IS NOT NULL
            AND format.name != ''
    )
    SELECT
        scope,
        format_name,
        COUNT(*) AS count_fields,
        COUNT(DISTINCT instance) AS count_instances,
        ARRAY_AGG(DISTINCT instance) AS instances
    FROM
        preprocessed
    GROUP BY
        scope, format_name
    ORDER BY
        count_fields DESC
);

CREATE OR REPLACE VIEW routine_usage AS (
    WITH step1 AS (
        SELECT
            scope,
            format.name AS format_name,
            filename.split('/')[2] AS instance,
            UNNEST(transformers) AS transformer
        FROM
            fields
        WHERE
            transformers IS NOT NULL
    ),
    step2 AS (
        SELECT
            scope,
            format_name,
            instance,
            UNNEST(transformer.args) AS arg
        FROM
            step1
    ),
    run_usages AS (
        SELECT
            scope,
            format_name,
            instance,
            trim(arg.value, '"').str_split('/')[4] AS routine
        FROM
            step2
        WHERE
            arg.value LIKE '%/api/run%'
    ),
    by_routine_scope AS (
        SELECT
            routine,
            scope,
            COUNT(*) AS count_usages,
            COUNT(DISTINCT instance) AS count_instances,
            ARRAY_AGG(DISTINCT format_name) AS format_names,
            ARRAY_AGG(DISTINCT instance) AS instances
        FROM
            run_usages
        GROUP BY
            routine, scope
    ),
    with_totals AS (
        SELECT
            *,
            SUM(count_usages) OVER (PARTITION BY routine) AS total_count
        FROM
            by_routine_scope
    )
    SELECT
        routine,
        scope,
        count_usages,
        count_instances,
        format_names,
        instances
    FROM
        with_totals
    ORDER BY
        total_count DESC,
        routine,
        count_usages DESC
);

CREATE OR REPLACE VIEW enrichment_webservices_usage AS (
    SELECT
        webServiceUrl,
        COUNT(*) AS count_usages,
        ARRAY_AGG(DISTINCT filename.str_split('/')[2]) AS instances
    FROM
        enrichments
    WHERE
        webServiceUrl IS NOT NULL
        AND webServiceUrl != ''
    GROUP BY
        webServiceUrl
    ORDER BY
        count_usages DESC, webServiceUrl ASC
);

COPY (FROM enrichments) TO 'enrichments.tsv' (DELIMITER '\t');
COPY (FROM fields) TO 'fields.tsv' (DELIMITER '\t');
COPY (FROM precomputeds) TO 'precomputeds.tsv' (DELIMITER '\t');
COPY (FROM subresources) TO 'subresources.tsv' (DELIMITER '\t');
COPY (FROM routine_usage) TO 'routine_usage.tsv' (DELIMITER '\t');
COPY (FROM field_format_uage) TO 'field_format_uage.tsv' (DELIMITER '\t');
COPY (FROM enrichment_webservices_usage) TO 'enrichment_webservices_usage.tsv' (DELIMITER '\t');
