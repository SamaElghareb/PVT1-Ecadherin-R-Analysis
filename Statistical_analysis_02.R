#statistical analysis
#PROJECT:-PVT1 rs13255292 and tumor grade
source("scripts/data_setup_01.R")
exists("genotype_grade")
print(genotype_grade)
library(rcompanion)
fisher_results <- fisher.test(
  as.matrix(genotype_grade[, -1])
)
cramerv_result <- cramerV(as.matrix(genotype_grade[, -1]))
fisher_results
cramerv_result
#Create a summary table
results_summary <- data.frame(
  analysis = c("fisher exact test", "cramer's test"),
  Result = c(fisher_results$p.value,
              as.numeric(cramerv_result))
)
write.csv(results_summary,
          "output/genotype_grade_analysis.csv",
          row.names = FALSE)


genotype_percent <- as.data.frame(
  prop.table(
    as.matrix(genotype_grade[, -1]),
    margin = 1
  ) * 100
)
genotype_percent$Grade <- genotype_grade$Grade

print(genotype_percent)
#CONVERT THE TABLE TO THE LONG FORMAT
genotype_long <- reshape(genotype_percent,
                         varying = c("CC", "CT", "TT"),
                         v.names = "Precentage",
                         timevar = "Genotype",
                         times = c("CC", "CT", "TT"),
                         direction = "long")

library(ggplot2)
packageVersion("ggplot2")

barplot(
  height = t(as.matrix(genotype_percent[, c("CC", "CT", "TT")])),
  names.arg = genotype_percent$Grade,
  col = c("skyblue", "orange", "seagreen3"),
  xlab = "Tumor Grade",
  ylab = "Genotype Distribution (%)",
  main = "PVT1 Genotype Distribution by Tumor Grade",
  ylim = c(0, 100),
  legend.text = c("CC", "CT", "TT")
) 
ggsave(filename = "figures/PVT1rs13255292_genotype.png",
       width = 8,
       height = 6,
       dpi = 300)
genotype_long <- reshape(
  genotype_percent,
  varying = c("CC", "CT", "TT"),
  v.names = "Percentage",
  timevar = "Genotype",
  times = c("CC", "CT", "TT"),
  direction = "long"
)

print(genotype_long)

ggplot(
  genotype_long,
  aes(x = Grade, y = Percentage, fill = Genotype)
) +
  geom_col() +
  labs(
    title = "PVT1 Genotype Distribution by Tumor Grade",
    x = "Tumor Grade",
    y = "Genotype Distribution (%)",
    fill = "Genotype"
  ) +
  scale_y_continuous(limits = c(0, 100)) +
  theme_minimal()
ggsave(filename = "figures/PVT1_genotype_grade.png",
       width = 8,
       height = 6,
       dpi = 300)
library(ggplot2)
heatmap_plot <- ggplot(
  genotype_long, aes(x= Genotype, y= Grade, fill = Percentage))+
  geom_tile(colour = "white", linewidth = 1)+
  geom_text(
    aes(label = sprintf("%.1f%%", Percentage )),
    color = "black" ,
    size = 4
    ) +
  scale_fill_gradient(
    low = "white",
    high = "steelblue",
    name = "Percentage"
  ) +
  labs(
    title = "PVT1 genotype distribution by tumor grade",
    x = "Genotype",
    y = "tumorgrade"
  ) + 
  theme_minimal(base_size = 12) +
  theme(
    panel.grid = element_blank(),
    axis.text = element_text(color = "black"),
    plot.title = element_text(
      face = "bold",
      hjust = 0.5
    ),
    legend.position = "right"
  )
print(heatmap_plot)
ggsave(
  "figures/PVT1_genotype_heatmap.png",
  plot = heatmap_plot,
  width = 7,
  height = 4.5,
  dpi = 300
)  
  
  


