# Deal with NULL and Blank values (if the value is blank set the value as NULL and then add the values simialar to corresponding table)

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



# Delete all null values

delete
from layoffs_staging2
where total_laid_off is null and percentage_laid_off is null;

# Drop the row_num column

alter table layoffs_staging2
drop column row_num; 

select *
from layoffs_staging2;
