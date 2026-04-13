# Load required libraries
library(spmodel)
library(ggplot2)
library(viridis)

# Load trained model and df
load("CorbinBMatthewW.Rdata")

# Generate predictions
Predictions <- predict(sp_lm, newdata = full_dataframe)
full_dataframe$Predictions <- Predictions

# Plot predictions
ggplot() +
  geom_point(data = full_dataframe, aes(x = POINT_X, y = POINT_Y, color = Predictions))+
  scale_color_viridis()+
  labs(title = "CWSI Predictions",
       x = "X Coordinate",
       y = "Y Coordinate")+
  theme_minimal()
