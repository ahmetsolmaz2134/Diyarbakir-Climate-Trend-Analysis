# ==============================================================================
# Proje: Diyarbak??r Climate Trend Analysis (1990-2025)
# Script 02: Trend Analizi ve Yay??n Kalitesinde Grafikler
# ==============================================================================

library(tidyverse)
library(trend)
library(zyp)

# Output klas??r?? yoksa otomatik olu??tur
if(!dir.exists("output")) dir.create("output")

# Veriyi oku
diyarbakir_annual <- read_csv("data/diyarbakir_annual_climate.csv")

# 1. GRAF??K: S??cakl??k Trendi
p_temp <- ggplot(diyarbakir_annual, aes(x = Year, y = Tavg_annual)) +
  geom_line(color = "#e63946", linewidth = 1) +
  geom_point(color = "#1d3557", size = 2.5) +
  geom_smooth(method = "lm", color = "#d62828", linetype = "dashed", se = TRUE, fill = "#e63946", alpha = 0.15) +
  labs(
    title = "Diyarbak??r Y??ll??k Ortalama S??cakl??k Trendi (1990???2025)",
    subtitle = "NASA POWER Verileri ile Mann-Kendall Trend Analizi",
    x = "Y??l",
    y = "Ortalama S??cakl??k (??C)",
    caption = "G??rselle??tirme: R ggplot2 | Veri: NASA POWER"
  ) +
  theme_minimal(base_size = 12) +
  theme(plot.title = element_text(face = "bold", size = 14))

# Grafi??i PNG olarak kaydet
ggsave("output/diyarbakir_temp_trend.png", plot = p_temp, width = 9, height = 5, dpi = 300)

# 2. GRAF??K: Ya?????? Trendi
p_precip <- ggplot(diyarbakir_annual, aes(x = Year, y = Precip_annual)) +
  geom_col(fill = "#457b9d", alpha = 0.85, width = 0.7) +
  geom_smooth(method = "lm", color = "#1d3557", linetype = "dashed", se = FALSE) +
  labs(
    title = "Diyarbak??r Y??ll??k Toplam Ya?????? De??i??imi (1990???2025)",
    subtitle = "Y??ll??k Toplam Ya?????? Miktarlar?? ve Do??rusal Trend ??izgisi",
    x = "Y??l",
    y = "Toplam Ya?????? (mm)",
    caption = "G??rselle??tirme: R ggplot2 | Veri: NASA POWER"
  ) +
  theme_minimal(base_size = 12) +
  theme(plot.title = element_text(face = "bold", size = 14))

# Grafi??i PNG olarak kaydet
ggsave("output/diyarbakir_precip_trend.png", plot = p_precip, width = 9, height = 5, dpi = 300)

cat("\n??? Analiz bitti! Grafikler 'output/' klas??r??ne kaydedildi.\n")