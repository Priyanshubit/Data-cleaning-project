#2 Standardize the data : finding isuues in your data and then fixing it 



# step1 : remove extra spaces from texts and update it

# checking tables
SELECT 
    *
FROM
    layoffs_staging2;

# trimming extra spaces
SELECT 
    company, TRIM(company)
FROM
    layoffs_staging2;

#update
UPDATE layoffs_staging2 
SET 
    company = TRIM(company);



#step 2: organise industry names according to understanding and update it

select *
from layoffs_staging2
where industry like 'crypto%';

update layoffs_staging2
set industry ='Crypto'
where industry like 'crypto%';


#step 3: Rename incorrect locations such as DÃ¼sseldorf, FlorianÃ³polis

select *
from layoffs_staging2
where location like '%dorf';

update layoffs_staging2
set location ='Dusseldorf'
where location like 'DÃ¼sseldorf';


select *
from layoffs_staging2
where location like '%polis';

update layoffs_staging2
set location='Florianapolis'
where location like 'FlorianÃ³polis';



#step 3: Rename incorrect country such as United States.

update layoffs_staging2
set country ='United States'
where country like 'United States.';

select  country
from layoffs_staging2
where country like 'United States';

select *
from layoffs_staging2;



#step 4: Change date format as it is in TEXT( first change it's format and then change type)

select `date`, str_to_date(`date`,'%m/%d/%y') as Formated_date
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date`,'%m/%d/%Y');

alter table layoffs_staging2
modify column `date` date;


#step 5: Deal with NULL and Blank values (if the value is blank set the value as NULL and
# then add the values simialar to corresponding table)

select *
from layoffs_staging2
where industry ='';

update layoffs_staging2
set industry =null
where industry ='';

select *
from layoffs_staging2
where industry is null;


select t1.industry, t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2 on t1.company=t2.company
where t1.industry is null and t2.industry is not null; 

update layoffs_staging2 t1
join layoffs_staging2 t2 on t1.company=t2.company
set t1.industry=t2.industry
where t1.industry is null and t2.industry is not null; 

select *
from layoffs_staging2
where company='airbnb';

select *
from layoffs_staging2
where company like 'Bally%';


select *
from layoffs_staging2
where location like 'providen%';



#step 6: Delete all null values

delete
from layoffs_staging2
where total_laid_off is null and percentage_laid_off is null;

#step 7: Drop the row_num column

alter table layoffs_staging2
drop column row_num; 

select *
from layoffs_staging2;
