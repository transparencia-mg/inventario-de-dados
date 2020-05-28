## 4.3.2 [De-Identifying Numeric Quasi-Identifiers](https://csrc.nist.gov/CSRC/media/Publications/sp/800-188/draft/documents/sp800_188_draft2.pdf)

1492 Once a determination is made regarding quasi-identifiers, they should be transformed. A variety
1493 of techniques are available to transform quasi-identifiers:

1494 ● Top and bottom coding. Outlier values that are above or below certain values are coded
1495 appropriately. For example, the HIPAA Privacy Rules calls for ages over 89 to be
“aggregated into a single category of age 90 or older.”113 1496

1497 ● Micro aggregation, in which individual microdata are combined into small groups that
preserve some data analysis capability while providing for some disclosure protection.
1498
1499 ● Generalize categories with small values. When preparing contingency tables, several
1500 categories with small values may be combined. For example, rather than reporting that
1501 there is 1 person with blue eyes, 2 people with green eyes, and 1 person with hazel eyes,
1502 it may be reported that there are 4 people with blue, green or hazel eyes.

1503 ● Data suppression. Cells in contingency tables with counts lower than a predefined
1504 threshold can be suppressed to prevent the identification of attribute combinations with
small numbers.115 1505

1506 ● Blanking and imputing. Specific values that are highly identifying can be removed and
1507 replaced with imputed values.

1508 ● Attribute or record swapping, in which attributes or records are swapped between
1509 records representing individuals. For example, data representing families in two similar
1510 towns within a county might be swapped with each other. “Swapping has the additional
1511 quality of removing any 100-percent assurance that a given record belongs to a given
household,”116 1512 while preserving the accuracy of regional statistics such as sums and
1513 averages. For example, in this case the average number of children per family in the
1514 county would be unaffected by data swapping.

1515 ● Noise infusion. Also called “partially synthetic data,” small random values may be added
1516 to attributes. For example, instead of reporting that a person is 84 years old, the person
1517 may be reported as being 79 years old. Noise infusion increases variance and leads to
attenuation bias in estimated regression coefficients and correlations among attributes.

1518
1519 These techniques (and others) are described in detail in several publications, including:

1520 ● Statistical Policy Working Paper #2 (Second version, 2005) by the Federal Committee on
Statistical Methodology.118 1521 This 137-page paper also includes worked examples of
1522 disclosure limitation, specific recommended practices for Federal agencies, profiles of
1523 federal statistical agencies conducting disclosure limitation, and an extensive
1524 bibliography.

1525 ● The Anonymisation Decision-Making Framework, by Mark Elliot, Elaine MacKey,
1526 Kieron O’Hara and Caroline Tudor, UKAN, University of Manchester, Manchester, UK.
1527 2016. This 156-page book provides tutorials and worked examples for de-identifying data
1528 and calculating risk.

1529 ● IHE IT Infrastructure Handbook, De-Identification, Integrating the Healthcare
1530 Enterprise, June 6, 2014. http://www.ihe.net/User_Handbooks/