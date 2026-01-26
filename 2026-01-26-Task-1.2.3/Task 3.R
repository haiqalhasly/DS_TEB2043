# Prompt radius value
radius <- as.numeric(readline(prompt="Enter radius: "))
# Calc circle value
area <- pi * radius**2
# Display circle
print(round(area, digits = 3))