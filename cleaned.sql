SELECT * FROM amazon_sales;

-- Total Records
SELECT COUNT(*) FROM amazon_sales;


-- Total NULL values in each column
SELECT COUNT(*) FILTER (WHERE orderid IS NULL) AS order_id_null, 
       COUNT(*) FILTER (WHERE index IS NULL) AS index_null,
	   COUNT(*) FILTER (WHERE date IS NULL) AS date_null,
	   COUNT(*) FILTER (WHERE fulfilment IS NULL) AS fulfilment_null,
	   COUNT(*) FILTER (WHERE saleschannel IS NULL) AS saleschannel_null,
	   COUNT(*) FILTER (WHERE shipservicelevel IS NULL) AS shipservicelevel_null,
	   COUNT(*) FILTER (WHERE style IS NULL) AS style_null,
	   COUNT(*) FILTER (WHERE sku IS NULL) AS sku_null,
	   COUNT(*) FILTER (WHERE category IS NULL) AS category_null,
	   COUNT(*) FILTER (WHERE size IS NULL) AS size_null,
	   COUNT(*) FILTER (WHERE asin IS NULL) AS asin_null,
	   COUNT(*) FILTER (WHERE courierstatus IS NULL) AS courierstatus_null,
	   COUNT(*) FILTER (WHERE qty IS NULL) AS qty_null,
	   COUNT(*) FILTER (WHERE currency IS NULL) AS currency_null,
	   COUNT(*) FILTER (WHERE amount IS NULL) AS amount_null,
	   COUNT(*) FILTER (WHERE shipcity IS NULL) AS shipcity_null,
	   COUNT(*) FILTER (WHERE shipstate IS NULL) AS shipstate_null,
	   COUNT(*) FILTER (WHERE shippostalcode IS NULL) AS shippostalcode_null,
	   COUNT(*) FILTER (WHERE shipcountry IS NULL) AS shipcountry_null
	   COUNT(*) FILTER (WHERE promotionids IS NULL) AS promotionids_null,
	   COUNT(*) FILTER (WHERE b2b IS NULL) AS b2b_null,
	   COUNT(*) FILTER (WHERE fulfilledby IS NULL) AS fulfilledby_null,
	   COUNT(*) FILTER (WHERE unnamed22 IS NULL) AS unnamed22_null
	   FROM amazon_sales;

-- Cleaning the dataset


-- Dropped promotionids, b2b and unnamed22 columns as there are many null values
ALTER TABLE amazon_sales DROP column promotionids;
ALTER TABLE amazon_sales DROP column b2b;
ALTER TABLE amazon_sales DROP column unnamed22;


-- Replaced currency with INR since only INR exists in all the rows
SELECT DISTINCT currency FROM amazon_sales;
UPDATE amazon_sales
SET currency = 'INR'
WHERE currency IS NULL;
SELECT COUNT(*) FROM amazon_sales WHERE currency IS NULL;


-- Dropped the rows with amount = NULL
DELETE FROM amazon_sales WHERE amount IS NULL OR amount = ' ';
SELECT COUNT(*) FROM amazon_sales WHERE amount IS NULL;


-- Updated courier_sales, shipcity, shippostalcode and shipstate with 'Unknown'
UPDATE amazon_sales
SET courierstatus = 'Unknown'
WHERE courierstatus IS NULL OR courierstatus = ' ';

UPDATE amazon_sales
SET shipcity = 'Unknown'
WHERE shipcity IS NULL OR shipcity = ' ';

UPDATE amazon_sales
SET shipstate = 'Unknown'
WHERE shipstate IS NULL OR shipstate = ' ';

UPDATE amazon_sales
SET shippostalcode = 'Unknown'
WHERE shippostalcode IS NULL OR shippostalcode = ' ';

-- Change the datatypes
ALTER TABLE amazon_sales
ALTER COLUMN amount TYPE NUMERIC
USING amount::NUMERIC;

ALTER TABLE amazon_sales
ALTER COLUMN qty TYPE NUMERIC
USING qty::NUMERIC;

ALTER TABLE amazon_sales
ALTER COLUMN date TYPE DATE
USING date::DATE;


