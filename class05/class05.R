# Class 5 Data Visualization

plot(1:5)

# That was base R plot - quick and not nice! 
# We will use an add on package called ggplot2

library(ggplot2)

plot(cars)
#Every ggplot has at least 3 layers: data + aes + geoms

ggplot(data=cars) +
  aes(x=speed, y=dist) +
  geom_point()

ggplot(cars, aes(speed, dist)) + geom_point()

ggplot(data=cars) +
  aes(x=speed, y=dist) +
  geom_point(col="blue")

p <- ggplot(data=cars) +
  aes(x=speed, y=dist) +
  geom_point()

p + geom_line()

p + geom_smooth()
p + geom_smooth(method="lm")

p + labs(title = "Car Speed vs Distance") +
  xlab("Speed (MPH)") +
  ylab("Stopping Distance (ft)")

#RNA-Seq plot


url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

ggplot(data = genes) +
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point() +
  labs(title = "Gene Expression Changes") +
  xlab("Control (no drug") +
  ylab("Drug Treatment")

nrow(genes)

ncol(genes)
colnames(genes)

ggplot(data = genes) +
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point() +
  theme_bw() +
  labs(title = "Gene Expression Changes") +
  xlab("Control (no drug") +
  ylab("Drug Treatment")

ggplot(data = genes) +
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point() +
  theme_bw()

p <- ggplot(genes) +
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point()

p + scale_colour_manual( values=c("blue", "gray", "red"))

ggplot(data = genes) +
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point() +
  scale_colour_manual( values=c("blue", "gray", "red")) +
  labs(title = "Gene Expression Changes") +
  xlab("Control (no drug)") +
  ylab("Drug Treatment")

url <- "https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv"

gapminder <- read.delim(url)

install.packages("dplyr")
library(dplyr)
gapminder_2007 <- gapminder %>% filter(year==2007)

ggplot(gapminder_2007) +
  aes(x=gdpPercap, y=lifeExp, color=continent, size=pop) +
  geom_point(alpha=0.5) +
  scale_size_area(max_size = 10)

gapminder_top5 <- gapminder %>% 
  filter(year==2007) %>% 
  arrange(desc(pop)) %>% 
  top_n(5, pop)

gapminder_top5

ggplot(gapminder_top5) +
  geom_col(aes(x = country, y = pop, fill = continent))

ggplot(gapminder_top5) +
  geom_col(aes(x = country, y = pop, fill = lifeExp))
