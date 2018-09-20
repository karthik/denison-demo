measurementsIndianapolis <- filter(measurementsIndianapolis, !is.na(latitude))
# now transform to daily data
measurementsIndianapolis <- measurementsIndianapolis %>%
  mutate(day = as.Date(dateLocal)) %>%
  group_by(location, day) %>%
  summarize(value = mean(value),
            longitude = longitude[1],
            latitude = latitude[1]) %>%
  ungroup()
measurementsIndianapolis %>% head() %>% knitr::kable()


library("rnoaa")
station_data <- ghcnd_stations()
lat_lon_df <- select(measurementsIndianapolis,
                     location,
                     latitude,
                     longitude) %>% unique() %>%
  ungroup() %>%
  rename(id = location) %>%
  mutate(id = factor(id))

stationsIndianapolis <- meteo_nearby_stations(lat_lon_df = as.data.frame(lat_lon_df),
                                              station_data = station_data,
                                              radius = 5,
                                              year_min = as.character(format(Sys.Date(), "%Y")),
                                              var = c("TAVG", "PRCP"))
stationsIndianapolis <- unique(bind_rows(stationsIndianapolis) %>% select(- distance))

save(stationsIndianapolis, file = "data/stationsIndianapolis.RData")