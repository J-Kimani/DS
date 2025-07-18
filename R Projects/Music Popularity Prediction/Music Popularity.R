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
library(corrplot)
library(caret)
library(randomForest)

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

# From these visualizations, we can observe that higher energy levels, loudness and danceability tend to correlate positively with higher popularity scores.
# now looking at correlation
# selecting only the essential features 
selected_features <- c("danceability",
                       "energy",
                       "key",
                       "loudness",
                       "mode",
                       "speechiness",
                       "acousticness",
                       "liveness",
                       "valence",
                       "tempo",
                       "duration_ms",
                       "track_popularity")

new_data <- reduced[, selected_features]

# compute correlation matrix
corr_matrix <- cor(new_data, use= "complete.obs")
corr_matrix  

# Plotting the correlation plot
corrplot(corr_matrix, method= "color", type= "upper",
  tl.col= "black", tl.cex= 0.8, number.cex= 0.7,
  col= colorRampPalette(c("blue", "white", "red"))(200),
  addCoef.col= "black", title= "Correlation Matrix", mar= c(0,0,2,0))

# Correlation Insights:
# - Most features have weak correlation with `track_popularity`, suggesting no single strong predictor.
# - `danceability`, `acousticness`, and `speechiness` show slight positive correlations with popularity.
# - `energy`, `valence`, and `duration_ms` have mild negative correlations with popularity.
# - High correlation pairs include:
#     • `energy` ↔ `loudness` (0.73)
#     • `danceability` ↔ `valence` (0.35)
#     • `energy` ↔ `valence` (0.43)
# - These patterns indicate some multicollinearity, which we should consider during modeling.

# Distribution plots for each music feature
for (feature in features) {
  ggplot(reduced, aes_string(x = feature)) + 
    geom_histogram(aes(y= ..density..), bins = 30, fill = "skyblue", color= "black", alpha= 0.7) +
    geom_density(color= "darkblue", size= 1)+
    ggtitle(paste("Distribution of", feature))+
    theme_minimal()+
    theme(plot.title = element_text(hjust = 0.5)) +
    labs(x = feature, y= "Density")-> p
    
  print(p)
  }

# Distribution Observations:
# - Right-skewed features: `duration_ms`, `tempo`, `liveness`, `acousticness`, `speechiness`
# - Left-skewed features: `loudness`, `energy`, `danceability`
# - `key` appears uniformly distributed
# - `valence` shows an approximately normal distribution

# Skewed distributions may benefit from transformation (e.g., log, Box-Cox)
# to improve model performance and meet assumptions of some regression models.


# Feature Selection and Model Training

# Based on correlation and distribution analysis, the following audio features
# were found to have meaningful relationships with `track_popularity`:
# - energy, valence, danceability, loudness, acousticness,
#   tempo, speechiness, and liveness
#
# These features reflect key musical attributes that influence listener engagement
# and can therefore support predictive modeling.
#
# Next step:
# We'll split the data into training and testing sets, scale the features,
# and train a Random Forest Regression model to predict song popularity.
rf_features <- c("energy", "valence", "danceability", "loudness", "acousticness", "tempo", "speechiness", "liveness")

X <- reduced[, rf_features]
y <- reduced$track_popularity

# split the data into training and test size 80/20
set.seed(42)
train_index <- createDataPartition(y,p= 0.8, list= FALSE)
X_train <- X[train_index, ]
X_test <- X[-train_index, ]
y_train <- y[train_index]
y_test <- y[-train_index]

# Normalize the features using preProcess
scaler <- preProcess(X_train, method = c("center", "scale"))
X_train_scaled <- predict(scaler, X_train)
X_test_scaled <- predict(scaler, X_test)

# Define training control and tuning grid for Random Forest
control <- trainControl(method = "cv", number= 3)
tune_grid <- expand.grid(
  .mtry = c(2, 3, 4)
)

# Train the Random Forest model
set.seed(42)
rf_model <- train(
  x = X_train_scaled,
  y = y_train,
  method = "rf",
  metric = "RMSE",
  trControl = control,
  tuneGrid = tune_grid,
  n_tree = 100
)

# Best model summary
print(rf_model$bestTune)
best_rf_model <- rf_model$finalModel

# Make predictions
y_pred <- predict(rf_model, newdata =  X_test_scaled)
head(y_pred)

# Create a data frame for actual vs predicted
results <- data.frame(
  Actual = y_test,
  Predicted = y_pred
)

# Plot actual vs predicted
ggplot(results, aes(x = Actual, y = Predicted)) + 
  geom_point(alpha = 0.7) +
  geom_abline(intercept = 0, slope = 1, color = "red", size = 1.2)
  labs(
    title = "Actual vs Predicted Popularity",
    x = "Actual Popularity",
    y = "Predicted Popularity"
  )+
theme_minimal()    

