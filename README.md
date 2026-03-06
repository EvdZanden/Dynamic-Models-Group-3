# Dynamic-Models-Group-3
In this project, we worked with a three-species model to simulate continuous chaos. The three species in this model were plants, hares, and lynxes. The plants are eaten by the hares, and the hares are eaten by the lynxes; this cycle repeats.
## Model Parameters
The model contains the following parameters (also described in the code):

**a1** = maximum consumption rate of the hares eating the plants;

**a2** = maximum consumption rate of the lynxes eaten the hares;

**b1** = strength of saturation of the hares;

**b2** = strength of saturation of the lynxes;

**d1** = per capita death rate of the hares;

**d2** = per capita death rate of the lynxes
## Scenarios
The assignment asked us to change the parameter values for three different scenarios. These files can be found in the repo as MATLAB files under the names ScenarioX:

**Scenario 1:** The system exhibits stable oscillations with a periodicity of approximately 70 months;

**Scenario 2:** The lynx population goes extinct (population very close to zero) after a year, and plants and hares stabilize within 120 months.;

**Scenario 3:** The system shows chaotic behavior, and the lynx population peaks twice within the 200-month period. What makes this behavior chaotic and not oscillating or random?
## Installation
To run the scripts, you will need MATLAB version R2024b or a newer version.
