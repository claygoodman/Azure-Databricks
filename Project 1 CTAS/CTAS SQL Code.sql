--adapted from code samples used in databricks data engineering demo practice
%sql
CREATE TABLE IF NOT EXISTS DemoTrans_ctas AS
SELECT Date,AccountName,Entity,Category,SubCategory,Amount
FROM read_files('/Volumes/learningadb/tiogamdbprojects/filevol/trans1.csv',
format => 'csv',
header => true,
inferSchema => true);

%sql
SELECT * FROM DemoTrans_ctas


--Using Insert from second file to append additional data to the DemoTrans_ctas TABLE
%sql
INSERT DemoTrans_ctas(Date,AccountName,Entity,Category,SubCategory,Amount)
SELECT Date,AccountName,Entity,Category,SubCategory,Amount 
FROM read_files(
    '/Volumes/learningadb/tiogamdbprojects/filevol/Trans2.csv',
    format => 'csv',
    header => true,
    inferSchema => true
  );