**The Report**

In this project we demonstrate data analysis, data manipulation, data visualization, algorithm design and implementation.

We work with the &quot;Players.xlsx&quot; file containing the data of Golden Boot 2017 of 25 soccer players. Each player has the following information: Age, Goals, Factor. &quot;Points&quot; is computed as &quot;Points = Goals x Factor&quot;. For example, Lionel Messi has 74 points.

The Players Analysis Program:

-  Computes the Points value for each soccer player.  

-  Ranks the soccer players in terms of points.  

-  Computes the Points value for each soccer player.  

-  Ranks the soccer players in terms of points.  

-  Creates a bar chart as follows: showing the points and ages information of top 10 soccer players  (in terms of points) following the ranking computed above.

-  Creates a bar chart as follows: showing the goals and ages information of top 10 soccer players  (in terms of goas) following the ranking computed above.

-  Creates a pie chart as follows by age;

- Calculates statistical data: min, max, average.

 
-         To compute the Points in Matlab, we use **element-wise** multiplication: Points = Goals.\*Factors;  
-         To rank the players in terms of points, we use the **sort** function   [_val_,_idx_] = **sort** (Points,&#39;descend&#39;);  
- where _val_ contains the points after sorting whereas _idx_ contains the corresponding indices.
- Out project has 2 m-files: main.m, PlayersAnalysis.m
- m - the start file (script). We need to run this file.
- In this file we create the menu and call the function for analysis (function PlayersAnalysis() from file PlayersAnalysis.m)
-
- The file PlayersAnalysis.m consists the functions:
- - PlayersAnalysis()
- - NumPlayers();
- - AverageGoals();
- - GetPoints();
- - AverageAge();
- - PlayersTop10Histogram(txt,data);%Points
- - GetPlayersInRange(txt,data);
- - PlayersTop10Histogram1(txt,data); %Goals
- - MinAge(data);
- - MaxAge(data);
- - GetPie(data);

We create 3 plots:

 
This is the part of the result from command window:

\*\* Players Analysis Program \*\*

Total # of players: 25

Average of goals: 25.640000

Average player age: 26.880000

Min of age: 21

Max of age: 32

Player                        Point

Lionel Messi                74.000000

Bas Dost                68.000000

…

Alexis Sánchez                48.000000

Mauro Icardi                48.000000

Ciro Immobile                44.000000

Timo Werner                42.000000

Sergio Agüero                40.000000

Diego Costa                40.000000

…

Dele Alli                36.000000

Minimum number of goals: 40

Maximum number of goals: 60

Names =

Player not found...

Minimum number of goals: 32

Maximum number of goals: 58

Lionel Messi

Bas Dost

Edinson Cavani
