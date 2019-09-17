# **EX02B**

## Jarod Smith and Matthew West

<br />

### First Normal Form (1NF)

PetName|PetType|PetBreed|PetDOB|OwnerLast|OwnerFirst|OwnerPhone|OwnerEmail|Service|Date|Charge
-------|-------|--------|------|---------|----------|----------|----------|-------|----|------
King|Dog|Std. Poodle|27-Feb-14|Downs|Marsha|201-823-5467|MarshaDowns@somewhere.com|Ear infection|17-Aug-16|65.00
Teddy|Cat|Cashmier|1-Feb-13|James|Richard|201-735-9812|RichardJames@somewhere.com|Nail clip|5-Sep-16|27.00
Filo|Dog|Std. Poodle|17-Jul-15|Downs|Marsha|201-823-5467|MarshaDowns@somewhere.com
AJ|Dog|Collie Mix|5-May-15|Frier|Liz|201-823-6578|LizFrier@somewhere.com|One year shots|5-May-16|42.50
Cedro|Cat||6-Jun-12|James|Richard|201-735-9812|RichardJames@somewhere.com|Nail clip|5-Sep-16|27.00
Woolley|Cat|||James|Richard|201-735-9812|RichardJames@somewhere.com|Skin infection|3-Oct-16|35.00
Buster|Dog|Border Collie|11-Dec-11|Trent|Miles|201-634-7865|MilesTrent@somewhere.com|Laceration repair|5-Oct-16|127.00
Jiddah|Cat|Abyssinian|1-Jul-08|Evans|Hilary|201-634-2345|HilaryEvans@somewhere.com|Booster shots|4-Nov-16|111.00

1NF: Basically the table we started with in the exercise. Some "unknown" or "???" values were tweaked because of
having a different value compared to the rest of the column.

<br />

### Second Normal Form (2NF)
3 Tables with the following themes: Pets, Owners, and Service

#### Pets

PetName|PetType|PetBreed|PetDOB|OwnerPhone
-------|-------|--------|------|----------
King|Dog|Std. Poodle|27-Feb-14|201-823-5467
Teddy|Cat|Cashmier|1-Feb-13|201-735-9812
Filo|Dog|Std. Poodle|17-Jul-15|201-823-5467
AJ|Dog|Collie Mix|5-May-15|201-823-6578
Cedro|Cat||6-Jun-12|201-735-9812
Woolley|Cat|||201-735-9812
Buster|Dog|Border Collie|11-Dec-11|201-634-7865
Jiddah|Cat|Abyssinian|1-Jul-08|201-634-2345

#### Owners

OwnerPhone|OwnerLast|OwnerFirst|OwnerEmail
----------|---------|----------|----------
201-823-5467|Downs|Marsha|MarshaDowns@somewhere.com
201-735-9812|James|Richard|RichardJames@somewhere.com
201-823-6578|Frier|Liz|LizFrier@somewhere.com
201-634-7865|Trent|Miles|MilesTrent@somewhere.com
201-634-2345|Evans|Hilary|HilaryEvans@somewhere.com

#### Service

ServiceID|PetName|Service|Date|Charge
---------|-------|-------|----|------
1|King|Ear infection|17-Aug-16|65.00
2|Teddy|Nail clip|5-Sep-16|27.00
3|AJ|One year shots|5-May-16|42.50
4|Cedro|Nail clip|5-Sep-16|27.00
5|Woolley|Skin infection|3-Oct-16|35.00
6|Buster|Laceration repair|5-Oct-16|127.00
7|Jiddah|Booster shots|4-Nov-16|111.00

PetName, OwnerPhone, and ServiceID these are the primary keys of their respective tables. PetName is a foreign key in
the service table and OwnerPhone is a foreign key within the Pets table.

<br />

### Third Normal Form (3NF)

#### Pets

PetName|PetType|PetBreed
-------|-------|--------
King|Dog|Std. Poodle
Teddy|Cat|Cashmier
Filo|Dog|Std. Poodle
AJ|Dog|Collie Mix
Cedro|Cat|
Woolley|Cat|
Buster|Dog|Border Collie
Jiddah|Cat|Abyssinian

#### Owners

OwnerPhone|OwnerLast|OwnerFirst|OwnerEmail
----------|---------|----------|----------
201-823-5467|Downs|Marsha|MarshaDowns@somewhere.com
201-735-9812|James|Richard|RichardJames@somewhere.com
201-823-6578|Frier|Liz|LizFrier@somewhere.com
201-634-7865|Trent|Miles|MilesTrent@somewhere.com
201-634-2345|Evans|Hilary|HilaryEvans@somewhere.com

#### Service

Service|Charge
-------|------
Ear infection|65.00
Nail clip|27.00
One year shots|42.50
Skin infection|35.00
Laceration repair|127.00
Booster shots|111.00

#### Pet Service

PetName|Service|Date
-------|-------|----
King|Ear infection|17-Aug-16
Teddy|Nail clip|5-Sep-16
AJ|One year shots|5-May-16
Cedro|Nail clip|5-Sep-16
Woolley|Skin infection|3-Oct-16
Buster|Laceration repair|5-Oct-16
Jiddah|Booster shots|4-Nov-16

For breaking down these tables in the normalization process further we seeked to eliminate more redundancies within the dataset. We spilt up the service table to distinguish between each particular service type and then what each pet needed. This makes adding services for the same pet in the future, for example, an easier process. For the pet table we removed PetDOB as it wasn't a relavent field and wasn't dependant or determinant for any other values.
