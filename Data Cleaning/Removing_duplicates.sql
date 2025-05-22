#DATA CLEANING
use world_layoffs;
show tables;

select *
from layoffs;



#1 Remove duplicates if any

# process:

# create a duplicate table named as layoffs_staging
# see the table is good or not 
# insert everything of layoofs into layoffs_staging

create table layoffs_staging
like layoffs;

insert into layoffs_staging
select *
from layoffs;

select *
from layoffs_staging;

# search for duplicate information
# if don't have any primary key use over() 

select *,
row_number() over( partition by company, location, industry, total_laid_off, 
percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_staging;


#Using cte's for good readabiilty and reuseability

with cte_use1 as
(
select *,
row_number() over( partition by company, location, industry, total_laid_off, 
percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_staging
)

#checking for duplicates

select *
from cte_use1
where row_num>1;

# recheck to make sure everything is fine

select *
from layoffs_staging
where company ='casper';

# to delete duplicates we can't do directly in mysql workbench we have to do something diffrent
# step 1: we have created another lookalike table but this time it is identitcal to staging_layoffs2
# Step 2: add a column name row_num and datatype should be int
# Step 3: Insert every thing from layoffs_staging to layoffs_staging2 including row_num
# step 4 : delete from layoffs_staging2 table where row_num>1

select* 
from layoffs_staging2;


insert into layoffs_staging2
select *, 
row_number() over( partition by company, location, industry, total_laid_off, 
percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_staging;

select *
from layoffs_staging2
where row_num>1;

delete
from layoffs_staging2
where row_num>1;





