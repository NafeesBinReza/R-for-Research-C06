library(tidyverse)
library(readxl)


library(dplyr)

data <- read_excel("Raw_Data/QOL_Raw.xlsx")

#Check_missing_value

is.na(data)
sum(is.na(data))

#remove_missing value

data <- na.omit(data)
sum(is.na(data))

sf36 <- data |> 
  select(20:55)


colnames(sf36)  <- paste("Q", 1:36)

colnames(sf36)

#Role_physical_functioning

physical_functioning <- sf36 |> 
  select(`Q 3`:`Q 12`) |> 
  mutate(across(`Q 3`:`Q 12`, ~case_when(
    . == "Yes, Limited a lot" ~ 0,
    . == "Yes, Limited a Little" ~50,
    . == "No, Not Limited at all" ~ 100,
    TRUE ~ NA_real_
  ))) |> 
  rowwise() |> 
  mutate( Physical_Functioning = mean(c_across(`Q 3`:`Q 12`), na.rm = TRUE))

          
#unique(physical_functioning$`Q 3`)
                




#Physical_role
physical_role <- sf36 |> 
  select(`Q 13`: `Q 16`) |> 
  mutate(across(`Q 13`:`Q 16`, ~ case_when(
    . == "Yes" ~ 0,
    . == "No" ~ 100,
    TRUE ~ NA_real_
  ))) |> 
  rowwise() |> 
  mutate( Physical_Role =  mean(c_across(`Q 13`:`Q 16`), na.rm =  TRUE))



#unique(physical_health$`Q 13`)


#Bodily_Pain

pain <- sf36 |> 
  select(`Q 21`, `Q 22`) |> 
  mutate(`Q 21` = case_when(
    `Q 21` == "Very Severe" ~ 0,
    `Q 21` == "Severe" ~ 20,
    `Q 21` == "Moderate" ~ 40,
    `Q 21` == "Mild" ~ 60,
    `Q 21` == "Very Mild" ~ 80,
    `Q 21` == "None" ~ 100,
    TRUE ~ NA_real_
  )) |> 
  mutate( `Q 22` = case_when(
    `Q 22` == "Not at all" ~ 100,  
    `Q 22` == "Moderately" ~ 75,
    `Q 22` == "A little bit" ~ 50,
    `Q 22` == "Extremely"   ~ 25,
    `Q 22` == "Quite a bit" ~ 0,
    TRUE ~ NA_real_
  )) |> 
  rowwise() |> 
  mutate( Pain = rowMeans(cbind(`Q 21`, `Q 22`), na.rm = TRUE))

#unique(bodily_pain$`Q 21`)




#General_health

general_health <- sf36 |> 
  select(`Q 1`, `Q 33`, `Q 34`, `Q 35`, `Q 36`) |>  
  mutate( `Q 1` = case_when(
    `Q 1` == "Excellent" ~ 100,
    `Q 1` == "Very Good" ~ 75,
    `Q 1` == "Good" ~ 50,
    `Q 1` == "Fair" ~ 25,
    `Q 1` == "Poor" ~ 0,
    TRUE ~ NA_real_
  ))  |> 
    mutate( `Q 33`=  case_when(
      `Q 33`== "Definitely false" ~ 100,
      `Q 33`== "Mostly false" ~ 75,    
      `Q 33`== "Don't know" ~ 50,
      `Q 33`== "Mostly true" ~ 25,     
      `Q 33`=="Definitely true" ~ 0,
      TRUE ~ NA_real_
    )) |> 
  mutate( `Q 35`=  case_when(
    `Q 35`== "Definitely false" ~ 100,
    `Q 35`== "Mostly false" ~ 75,    
    `Q 35`== "Don't know" ~ 50,
    `Q 35`== "Mostly true" ~ 25,     
    `Q 35`=="Definitely true" ~ 0,
    TRUE ~ NA_real_
  )) |> 
  mutate( `Q 34`=  case_when(
    `Q 34`== "Definitely false" ~ 0,
    `Q 34`== "Mostly false" ~ 25,    
    `Q 34`== "Don't know" ~ 50,
    `Q 34`== "Mostly true" ~ 75,     
    `Q 34`=="Definitely true" ~ 100,
    TRUE ~ NA_real_
  )) |> 
  mutate( `Q 36`=  case_when(
    `Q 36`== "Definitely false" ~ 0,
    `Q 36`== "Mostly false" ~ 25,    
    `Q 36`== "Don't know" ~ 50,
    `Q 36`== "Mostly true" ~ 75,     
    `Q 36`=="Definitely true" ~ 100,
    TRUE ~ NA_real_
  )) |> 
  rowwise() |> 
  mutate(General_Health = rowMeans(cbind(`Q 1`, `Q 33`, `Q 34`, `Q 35`, `Q 36`), na.rm = TRUE))

#unique(General_health$`Q 33`)

  
#Vitality(energy)
  
vitality <- sf36 |> 
    select(`Q 23`,`Q 27`,`Q 29`, `Q 31`) |> 
    mutate(`Q 23` =case_when(
      `Q 23`== "All of the time" ~ 100,
      `Q 23` == "Most of the time" ~ 80,
      `Q 23` == "A good Bit of the time" ~ 60,
      `Q 23` == "Some of the time" ~ 40,
      `Q 23` == "A little bit of the time" ~ 20,
      `Q 23` == "None of the Time" ~ 0,
      TRUE~NA_real_
    )) |> 
    mutate( `Q 27` =case_when(
              `Q 27`== "All of the time" ~ 100,
              `Q 27` == "Most of the time" ~ 80,
              `Q 27` == "A good Bit of the time" ~ 60,
              `Q 27` == "Some of the time" ~ 40,
              `Q 27` == "A little bit of the time" ~ 20,
              `Q 23` == "None of the Time" ~ 0,
              TRUE~NA_real_
            )) |> 
    mutate(`Q 29` = case_when(
    `Q 29` == "All of the time" ~ 0,
    `Q 29` == "Most of the time" ~ 20,
    `Q 29` == "A good Bit of the time" ~ 40,
    `Q 29` == "Some of the time" ~ 60,
    `Q 29` == "A little bit of the time" ~ 80,
    `Q 29` == "None of the Time" ~ 100,
    TRUE~NA_real_
  )) |> 
  mutate(`Q 31` = case_when(
    `Q 31` == "All of the time" ~ 0,
    `Q 31` == "Most of the time" ~ 20,
    `Q 31` == "A good Bit of the time" ~ 40,
    `Q 31` == "Some of the time" ~ 60,
    `Q 31` == "A little bit of the time" ~ 80,
    `Q 31` == "None of the Time" ~ 100,
    TRUE~NA_real_
  )) |> 
  rowwise() |> 
  mutate( Vitality = rowMeans(cbind(`Q 23`,`Q 27`,`Q 29`, `Q 31`), na.rm =  TRUE))
  
  #unique(vitality$`Q 29`)
  

#Social_functioning
  
Social_fuctioning <- sf36 |> 
    select(`Q 20`, `Q 32`)  |> 
    mutate( `Q 20` = case_when(
      `Q 20`== "Very Severe" ~ 0,
      `Q 20`== "Severe" ~ 25,
      `Q 20`== "Moderate" ~ 50,
      `Q 20`== "Mild" ~ 75,       
      `Q 20`== "Very Mild" ~ 75,     
      `Q 20`== "None" ~100,
      TRUE~NA_real_
    )) |> 
    mutate(`Q 32` =case_when(
      `Q 32`== "All of the time" ~ 0,
      `Q 32` == "Most of the time" ~ 25,
      `Q 32` == "Some of the time" ~ 50,
      `Q 32` == "A little bit of the time" ~ 75,
      `Q 32` == "None of the Time" ~ 100,
      TRUE~NA_real_
    )) |> 
    rowwise() |> 
    mutate( Social_Functioning= rowMeans(cbind(`Q 20`, `Q 32`), na.rm = TRUE))
    
#unique(Social_fuctioning$`Q 20`)


#Bodily_pain

bodily_pain <- sf36 |> 
  select(`Q 17`:`Q 19`) |> 
mutate(across(`Q 17`: `Q 19`, ~case_when(
    . == "Yes" ~ 0,
    . == "No" ~ 100,
    TRUE~NA_real_
  ))) |> 
  rowwise() |> 
  mutate(Bodily_Pain = mean(c_across(`Q 17`: `Q 19`), na.rm = TRUE))
#unique(emotional_problems$`Q 17`)



#Emotional_well-being_(mental_health)

Emotional_role <- sf36 |> 
  select(`Q 24`: `Q 26`, `Q 28`, `Q 30`) |> 
  mutate(across(`Q 24`: `Q 25`, ~case_when(
    . == "All of the time" ~ 0, 
    . == "Most of the time" ~ 20, 
    . == "A good Bit of the time" ~ 40,
    . == "Some of the time" ~ 60, 
    . == "A little bit of the time" ~ 80, 
    . ==  "None of the Time" ~100,
    TRUE ~ NA_real_ 
  ))) |> 
  mutate(`Q 28` = case_when(
    `Q 28` == "All of the time" ~ 0, 
    `Q 28` == "Most of the time" ~ 20, 
    `Q 28` == "A good Bit of the time" ~ 40,
    `Q 28` == "Some of the time" ~ 60, 
    `Q 28` == "A little bit of the time" ~ 80, 
    `Q 28` ==  "None of the Time" ~100,
    TRUE ~ NA_real_ 
  )) |> 
  mutate(`Q 30` = case_when(
    `Q 30` == "All of the time" ~ 0, 
    `Q 30` == "Most of the time" ~ 20, 
    `Q 30` == "A good Bit of the time" ~ 40,
    `Q 30` == "Some of the time" ~ 60, 
    `Q 30` == "A little bit of the time" ~ 80, 
    `Q 30` ==  "None of the Time" ~100,
    TRUE ~ NA_real_ 
  )) |> 
  mutate(`Q 26` = case_when(
    `Q 26` == "All of the time" ~ 100, 
    `Q 26` == "Most of the time" ~ 80, 
    `Q 26` == "A good Bit of the time" ~ 60,
    `Q 26` == "Some of the time" ~ 40, 
    `Q 26` == "A little bit of the time" ~ 20, 
    `Q 26` ==  "None of the Time" ~0,
    TRUE ~ NA_real_ 
  )) |> 
  mutate(Emotional_Role = rowMeans(cbind(`Q 24`, `Q 25`, `Q 26`,`Q 28`,`Q 30`), na.rm = TRUE))


#Combined_data

Demohraphic <- data |> 
  select(1:19)

sf_domain <- cbind(physical_functioning, physical_role, bodily_pain, general_health, vitality, 
         Emotional_role, pain, Social_fuctioning ) 

sf_domain <- sf_domain |> 
  select(Physical_Functioning, Physical_Role, Bodily_Pain, General_Health, Vitality,
         Emotional_Role, Pain, Social_Functioning) |> 
  mutate( Physical_Health = rowMeans(cbind(Physical_Functioning, Physical_Role, 
                            Bodily_Pain, General_Health, Vitality), na.rm = TRUE)) |> 
  mutate( Mental_Health = rowMeans(cbind(Emotional_role, pain, Social_fuctioning), 
                                   na.rm = TRUE)) |> 
  mutate(QOL_Score = rowMeans(cbind(Physical_Health, Mental_Health), na.rm = TRUE) ) |> 
  mutate(QOL_Status = case_when(
    QOL_Score <= 50 ~ "poor",
    QOL_Score > 50 ~ "good"
  ))

#combine_whole 

qol_data <- cbind(Demohraphic, sf_domain)


# export_data

write.csv(qol_data, "clean_data/ QOL_clean_data.csv", row.names = F)
