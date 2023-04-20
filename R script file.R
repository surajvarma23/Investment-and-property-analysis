rm(list = ls())
library(rio)
pao_2015 = import("PAO_Department of Review Data 2015 .xlsx")
View(pao_2015)
str(pao_2015)
pao_2015$ignore = NULL
colnames(pao_2015) = tolower(make.names(colnames(pao_2015)))
View(pao_2015)
head(pao_2015)
library(dplyr)

pao_2015$just_value_sqft = pao_2015$just.value/pao_2015$land.square.footage
pao_2015$non_school_sqft = pao_2015$assessed.value...non.school.district /pao_2015$land.square.footage
pao_2015$taxable_sqft = pao_2015$taxable.value...non.school.district/pao_2015$land.square.footage
pao_2015$land_sqft = pao_2015$land.value/pao_2015$land.square.footage





View(df1)
  
#16th street  
 df1 =  pao_2015 %>% group_by(x16th.st.corridor) %>%
    summarize(mean_just_value = mean(just_value_sqft),
              median_just_value = median(just_value_sqft),
              mean_non_school_district_assesed = mean(non_school_sqft),
              median_non_school_district_assesed = median(non_school_sqft),
              mean_taxable = mean(taxable_sqft),
              median_taxable = median(taxable_sqft),
              mean_land = mean(land_sqft),
              median_land = median(land_sqft),
              .groups = "drop") %>% as.data.frame() 
 colnames(df1)[1] = "corridors"
 #18th street  
 df2 =  pao_2015 %>% group_by(x18th.ave.s.corridor) %>%
   summarize(mean_just_value = mean(just_value_sqft),
             median_just_value = median(just_value_sqft),
             mean_non_school_district_assesed = mean(non_school_sqft),
             median_non_school_district_assesed = median(non_school_sqft),
             mean_taxable = mean(taxable_sqft),
             median_taxable = median(taxable_sqft),
             mean_land = mean(land_sqft),
             median_land = median(land_sqft),
             .groups = "drop") %>% as.data.frame() 
 colnames(df2)[1] = "corridors"
 rbind(df1,df2)
 #22th street  
 df3 =  pao_2015 %>% group_by(x22nd.st.s.corridor) %>%
   summarize(mean_just_value = mean(just_value_sqft),
             median_just_value = median(just_value_sqft),
             mean_non_school_district_assesed = mean(non_school_sqft),
             median_non_school_district_assesed = median(non_school_sqft),
             mean_taxable = mean(taxable_sqft),
             median_taxable = median(taxable_sqft),
             mean_land = mean(land_sqft),
             median_land = median(land_sqft),
             .groups = "drop") %>% as.data.frame() 
 colnames(df3)[1] = "corridors"
 #34th street  
 df4 =  pao_2015 %>% group_by(x34th.st.corridor) %>%
   summarize(mean_just_value = mean(just_value_sqft),
             median_just_value = median(just_value_sqft),
             mean_non_school_district_assesed = mean(non_school_sqft),
             median_non_school_district_assesed = median(non_school_sqft),
             mean_taxable = mean(taxable_sqft),
             median_taxable = median(taxable_sqft),
             mean_land = mean(land_sqft),
             median_land = median(land_sqft),
             .groups = "drop") %>% as.data.frame() 
 colnames(df4)[1] = "corridors"
 
 #49th street  
 df5 =  pao_2015 %>% group_by(x49th.st.corridor) %>%
   summarize(mean_just_value = mean(just_value_sqft),
             median_just_value = median(just_value_sqft),
             mean_non_school_district_assesed = mean(non_school_sqft),
             median_non_school_district_assesed = median(non_school_sqft),
             mean_taxable = mean(taxable_sqft),
             median_taxable = median(taxable_sqft),
             mean_land = mean(land_sqft),
             median_land = median(land_sqft),
             .groups = "drop") %>% as.data.frame() 
 colnames(df5)[1] = "corridors"
 
 #central street  
 df6 =  pao_2015 %>% group_by(central.ave.corridor) %>%
   summarize(mean_just_value = mean(just_value_sqft),
             median_just_value = median(just_value_sqft),
             mean_non_school_district_assesed = mean(non_school_sqft),
             median_non_school_district_assesed = median(non_school_sqft),
             mean_taxable = mean(taxable_sqft),
             median_taxable = median(taxable_sqft),
             mean_land = mean(land_sqft),
             median_land = median(land_sqft),
             .groups = "drop") %>% as.data.frame() 
 colnames(df6)[1] = "corridors"
 
 #mlk street  
 df7 =  pao_2015 %>% group_by(dr.mlk.jr.st..corridor) %>%
   summarize(mean_just_value = mean(just_value_sqft),
             median_just_value = median(just_value_sqft),
             mean_non_school_district_assesed = mean(non_school_sqft),
             median_non_school_district_assesed = median(non_school_sqft),
             mean_taxable = mean(taxable_sqft),
             median_taxable = median(taxable_sqft),
             mean_land = mean(land_sqft),
             median_land = median(land_sqft),
             .groups = "drop") %>% as.data.frame() 
 colnames(df7)[1] = "corridors"
 
 #5th street  
 df8 =  pao_2015 %>% group_by(x5thave..corridor) %>%
   summarize(mean_just_value = mean(just_value_sqft),
             median_just_value = median(just_value_sqft),
             mean_non_school_district_assesed = mean(non_school_sqft),
             median_non_school_district_assesed = median(non_school_sqft),
             mean_taxable = mean(taxable_sqft),
             median_taxable = median(taxable_sqft),
             mean_land = mean(land_sqft),
             median_land = median(land_sqft),
             .groups = "drop") %>% as.data.frame() 
 colnames(df8)[1] = "corridors"
 
 #combine all data frames 
 final = rbind(df1,df2,df3,df4,df5,df6,df7,df8)
 View(final)
 
 #drop NA rows
 final = na.omit(final)
 
 #replacing corridors column with street values
 final$corridors[final$corridors == "Within 16th St Corridor"] = "16th St"
 final$corridors[final$corridors == "Within 18th Ave S Corridor"] = "18th Ave St"
 final$corridors[final$corridors == "Within 22nd Street South Corridor"] = "22nd St"
 final$corridors[final$corridors == "Within 34th St Corridor"] = "34th St"
 final$corridors[final$corridors == "Within 49th St Corridor"] = "49th St"
 final$corridors[final$corridors == "Within Central Ave Corridor"] = "Central Ave"
 final$corridors[final$corridors == "Within DR. MARTIN LUTHER KING JR ST Corridor"] = "MLK Jr St"
 final$corridors[final$corridors == "Within 5th Ave South Corridor"] = "5th Ave St"

  

#export the corridor property values to excel
library(writexl)
write_xlsx(final,"C:/Users/csara/Documents//final_2015.xlsx")


#2022
pao_2022 = import("PAO_Department of Review Data 2022.xlsx")
pao_2022$ignore = NULL
colnames(pao_2022) = tolower(make.names(colnames(pao_2022)))
View(pao_2022)

library(dplyr)

pao_2022$just_value_sqft = pao_2022$just.value/pao_2022$land.square.footage
pao_2022$non_school_sqft = pao_2022$assessed.value...non.school.district /pao_2022$land.square.footage
pao_2022$taxable_sqft = pao_2022$taxable.value...non.school.district/pao_2022$land.square.footage
pao_2022$land_sqft = pao_2022$land.value/pao_2022$land.square.footage




#16th street  
dff1 =  pao_2022 %>% group_by(x16th.st.corridor) %>%
  summarize(mean_just_value = mean(just_value_sqft),
            median_just_value = median(just_value_sqft),
            mean_non_school_district_assesed = mean(non_school_sqft),
            median_non_school_district_assesed = median(non_school_sqft),
            mean_taxable = mean(taxable_sqft),
            median_taxable = median(taxable_sqft),
            mean_land = mean(land_sqft),
            median_land = median(land_sqft),
            .groups = "drop") %>% as.data.frame() 
colnames(dff1)[1] = "corridors"
#18th street  
dff2 =  pao_2022 %>% group_by(x18th.ave.s.corridor) %>%
  summarize(mean_just_value = mean(just_value_sqft),
            median_just_value = median(just_value_sqft),
            mean_non_school_district_assesed = mean(non_school_sqft),
            median_non_school_district_assesed = median(non_school_sqft),
            mean_taxable = mean(taxable_sqft),
            median_taxable = median(taxable_sqft),
            mean_land = mean(land_sqft),
            median_land = median(land_sqft),
            .groups = "drop") %>% as.data.frame() 
colnames(dff2)[1] = "corridors"

#22th street  
dff3 =  pao_2022 %>% group_by(x22nd.st.s.corridor) %>%
  summarize(mean_just_value = mean(just_value_sqft),
            median_just_value = median(just_value_sqft),
            mean_non_school_district_assesed = mean(non_school_sqft),
            median_non_school_district_assesed = median(non_school_sqft),
            mean_taxable = mean(taxable_sqft),
            median_taxable = median(taxable_sqft),
            mean_land = mean(land_sqft),
            median_land = median(land_sqft),
            .groups = "drop") %>% as.data.frame() 
colnames(dff3)[1] = "corridors"
#34th street  
dff4 =  pao_2022 %>% group_by(x34th.st.corridor) %>%
  summarize(mean_just_value = mean(just_value_sqft),
            median_just_value = median(just_value_sqft),
            mean_non_school_district_assesed = mean(non_school_sqft),
            median_non_school_district_assesed = median(non_school_sqft),
            mean_taxable = mean(taxable_sqft),
            median_taxable = median(taxable_sqft),
            mean_land = mean(land_sqft),
            median_land = median(land_sqft),
            .groups = "drop") %>% as.data.frame() 
colnames(dff4)[1] = "corridors"

#49th street  
dff5 =  pao_2022 %>% group_by(x49th.st.corridor) %>%
  summarize(mean_just_value = mean(just_value_sqft),
            median_just_value = median(just_value_sqft),
            mean_non_school_district_assesed = mean(non_school_sqft),
            median_non_school_district_assesed = median(non_school_sqft),
            mean_taxable = mean(taxable_sqft),
            median_taxable = median(taxable_sqft),
            mean_land = mean(land_sqft),
            median_land = median(land_sqft),
            .groups = "drop") %>% as.data.frame() 
colnames(dff5)[1] = "corridors"

#central street  
dff6 =  pao_2022 %>% group_by(central.ave.corridor) %>%
  summarize(mean_just_value = mean(just_value_sqft),
            median_just_value = median(just_value_sqft),
            mean_non_school_district_assesed = mean(non_school_sqft),
            median_non_school_district_assesed = median(non_school_sqft),
            mean_taxable = mean(taxable_sqft),
            median_taxable = median(taxable_sqft),
            mean_land = mean(land_sqft),
            median_land = median(land_sqft),
            .groups = "drop") %>% as.data.frame() 
colnames(dff6)[1] = "corridors"

#mlk street  
dff7 =  pao_2022 %>% group_by(dr.mlk.jr.st..corridor) %>%
  summarize(mean_just_value = mean(just_value_sqft),
            median_just_value = median(just_value_sqft),
            mean_non_school_district_assesed = mean(non_school_sqft),
            median_non_school_district_assesed = median(non_school_sqft),
            mean_taxable = mean(taxable_sqft),
            median_taxable = median(taxable_sqft),
            mean_land = mean(land_sqft),
            median_land = median(land_sqft),
            .groups = "drop") %>% as.data.frame() 
colnames(dff7)[1] = "corridors"

#5th street  
dff8 =  pao_2022 %>% group_by(x5thave..corridor) %>%
  summarize(mean_just_value = mean(just_value_sqft),
            median_just_value = median(just_value_sqft),
            mean_non_school_district_assesed = mean(non_school_sqft),
            median_non_school_district_assesed = median(non_school_sqft),
            mean_taxable = mean(taxable_sqft),
            median_taxable = median(taxable_sqft),
            mean_land = mean(land_sqft),
            median_land = median(land_sqft),
            .groups = "drop") %>% as.data.frame() 
colnames(dff8)[1] = "corridors"

#combine all data frames 
final_1 = rbind(dff1,dff2,dff3,dff4,dff5,dff6,dff7,dff8)
View(final_1)

#drop NA rows
final_1 = na.omit(final_1)

#replacing corridors column with street values
final_1$corridors[final_1$corridors == "Within 16th St Corridor"] = "16th St"
final_1$corridors[final_1$corridors == "Within 18th Ave S Corridor"] = "18th Ave St"
final_1$corridors[final_1$corridors == "Within 22nd Street South Corridor"] = "22nd St"
final_1$corridors[final_1$corridors == "Within 34th St Corridor"] = "34th St"
final_1$corridors[final_1$corridors == "Within 49th St Corridor"] = "49th St"
final_1$corridors[final_1$corridors == "Within Central Ave Corridor"] = "Central Ave"
final_1$corridors[final_1$corridors == "Within DR. MARTIN LUTHER KING JR ST Corridor"] = "MLK Jr St"
final_1$corridors[final_1$corridors == "Within 5th Ave South Corridor"] = "5th Ave St"

#export the corridor property values to excel
library(writexl)
write_xlsx(final_1,"C:/Users/csara/Documents//final_2022.xlsx")

