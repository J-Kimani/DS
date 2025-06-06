#  Music Popularity Prediction (R Version)
#
# Objective:  
# Predict the popularity score of songs using regression models based on their audio features. 
# This supports better playlist curation, user recommendations, and strategic music marketing.
#
# Dataset:  
# - Source: Kaggle (Spotify Most Popular Songs)  
# - Features: Danceability, energy, tempo, etc.  
# - Target: `popularity` (score from 0 to 100)

# Import libraries
library(dplyr)
library(ggplot2)

# import data
data <- read.csv("songs.csv")
head(data)
colnames(data)

# There is a need to reduce the number of columns from 28 to 17
reduced <- data %>%
  select(
    track_name,
    track_artist,
    track_id,
    track_popularity,
    track_album_release_date,
    duration_ms,
    spotify_url,
    danceability,
    energy,
    key,
    loudness,
    mode,
    speechiness,
    acousticness,
    liveness,
    valence,
    tempo
  )

head(reduced)

# infor on the data frame
str(reduced)

# Now we begin the exploratory data analysis (EDA) by examining how each key music feature relates to the target variable, popularity
# This will be a visualization of relationship between each feature and popularity
# Defining feature for  the plot
features <- c("danceability",
  "energy",
  "key",
  "loudness",
  "mode",
  "speechiness",
  "acousticness",
  "liveness",
  "valence",
  "tempo",
  "duration_ms")

summary(reduced)

# looping through each feature and plot scatterplots
for (feature in features) {
  ggplot(reduced, aes_string(x= feature, y= "track_popularity")) +
    geom_point(alpha= 0.5, color= "steelblue") + 
    ggtitle(paste("Popularity vs", feature)) +
    theme_minimal()+
    theme(plot.title = element_text(hjust = 0.5)) +
    labs(x = feature, y = "Popularity") -> p
  
  print(p)  
    }


