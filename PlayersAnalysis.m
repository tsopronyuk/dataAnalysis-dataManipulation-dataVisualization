%%
%% MATLAB program to analyze the data of Golden Boot 2017 of soccer players.
%%
%%

function Result = PlayersAnalysis(filename, analysis, optional)
  %%
  %% let's make sure the file exists:
  %%
  if exist(filename, 'file') ~= 2  
      fprintf('**Error: file "%s" cannot be found\n', filename);
      Result = '**Error: file not found';
      return;
  end
  
  %%
  %% Load the data:
  %%
  [data,txt,raw] = xlsread(filename);
   txt=txt(:,1);
   txt=txt(2:end);
  %%
  %% Perform requested analysis:
  %%
  if analysis == 1
      Result = NumPlayers(data);    
  elseif analysis == 2
      Result = AverageGoals(data);      
  elseif analysis == 3
      Result = GetPoints(txt,data);
  elseif analysis == 4
      Result = AverageAge(data);
  elseif analysis == 5
      Result = PlayersTop10Histogram(txt,data);%Points
  elseif analysis == 6
      Result = GetPlayersInRange(txt,data);
   elseif analysis == 7
       Result = PlayersTop10Histogram1(txt,data); %Goals
   elseif analysis == 8
       Result = MinAge(data);
   elseif analysis == 9
       Result = MaxAge(data);
   elseif analysis == 10
       Result = GetPie(data);
  else
      Result = '**Error: invalid analysis parameter';
  end
end

%% total # of rides in this dataset:
function Players = NumPlayers(data)
 [ Players, ~] = size(data);
end

%% average goals:
function AvgGoals = AverageGoals(data)
  AvgGoals = mean(data(:, 2));  %% trip goals in column 3:
end

%% min age:
function Age = MinAge(data)
  Age = min(data(:, 1));  %% trip ages in column 1:
end

%% max age:
function Age = MaxAge(data)
  Age = max(data(:, 1));  %% trip ages in column 1:
end

%% 'Points' is computed as 'Points = Goals x Factor':
function Points = GetPoints(txt,data)
  %To compute the Points in Matlab, we need to use element-wise multiplication:

Players = txt;
Goals = data(:,2);
Factors = data(:,3);

Points = Goals.*Factors;
fprintf('\n%s\t\t\t%s\n', 'Player', 'Point');
for i=1:size(txt,1)
    fprintf('%s\t\t%f\n', Players{i}, Points(i));
end
end

%% average age of male (1) or female (2) riders:
function AvgAge = AverageAge(data)
  AvgAge = mean(data(:, 1));  %% trip goals in column 3:;
end

%% showing the points and ages information of top 10 soccer players
%% (in terms of points) following the ranking
function Result = PlayersTop10Histogram(txt,data)
Players = txt;
Age= data(:,1);
Goals = data(:,2);
Factors = data(:,3);
  %To compute the Points in Matlab, we need to use element-wise multiplication: 
Points = Goals.*Factors;

%To rank the players in terms of points, we need to use the sort function 
[val,idx] = sort(Points,'descend');

%select the information of top 10 soccer players
AgeTop10=Age(idx(1:10));
PointsTop10=Points(idx(1:10));

%create matrix for bar
A=zeros(10,2);
A(:,1)=PointsTop10';
A(:,2)=AgeTop10';
%A=[PointsTop10' AgeTop10'];
X=1:10;

h=bar(X, A);
title('Golden Boot 2017');

%create the legend
l = cell(1,2);
l{1}='Points'; l{2}='Age';   
legend(h,l);

%replace the x-labels from i=1,2,...,10 to Players{idx(i)}
PlayersTop10 = cell(1,10);

for i =1:10
    PlayersTop10{i}=Players{idx(i)};
end

%set(gca,'XTickLabel',PlayersTop10)



% Set the tick locations and remove the labels
set(gca,'XTick',1:10,'XTickLabel','')

% Estimate the location of the labels based on the position
% of the xlabel
hx = get(gca,'XLabel'); % Handle to xlabel
set(hx,'Units','data');
pos = get(hx,'Position');
y = pos(2);


% Place the new labels
for i = 1:10
t(i) = text(i,y,PlayersTop10{i});
end

%rotation xlabel
set(t,'Rotation',20,'HorizontalAlignment','right')   
Result=PlayersTop10{i};
end

%% showing the points and goals information of top 10 soccer players
%% (in terms of points) following the ranking
function Result = PlayersTop10Histogram1(txt,data)
Players = txt;
Age= data(:,1);
Goals = data(:,2);

%To rank the players in terms of points, we need to use the sort function 
[val,idx] = sort(Goals,'descend');

%select the information of top 10 soccer players
AgeTop10=Age(idx(1:10));
GoalsTop10=Goals(idx(1:10));

%create matrix for bar
A=zeros(10,2);
A(:,1)=GoalsTop10';
A(:,2)=AgeTop10';
%A=[GoalsTop10' AgeTop10'];
X=1:10;

h=bar(X, A);
title('Golden Boot 2017');

%create the legend
l = cell(1,2);
l{1}='Goals'; l{2}='Age';   
legend(h,l);

%replace the x-labels from i=1,2,...,10 to Players{idx(i)}
PlayersTop10 = cell(1,10);

for i =1:10
    PlayersTop10{i}=Players{idx(i)};
end

%set(gca,'XTickLabel',PlayersTop10)



% Set the tick locations and remove the labels
set(gca,'XTick',1:10,'XTickLabel','')

% Estimate the location of the labels based on the position
% of the xlabel
hx = get(gca,'XLabel'); % Handle to xlabel
set(hx,'Units','data');
pos = get(hx,'Position');
y = pos(2);


% Place the new labels
for i = 1:10
t(i) = text(i,y,PlayersTop10{i});
end

%rotation xlabel
set(t,'Rotation',20,'HorizontalAlignment','right')   
Result=PlayersTop10{i};
end
%% Given a range of goals  
%% and returns the  names associated with this range of goals. 
function Result = GetPlayersInRange(txt,data);
  
  minV=input('Minimum number of goals: ');
  maxV=input('Maximum number of goals: ');
  
  Players = txt;
  
  Goals = data(:,2);
  
  
  [I] = find((Goals>= minV) &  (Goals<= maxV),1);  %% find index of station id
  if sum(I)>0 
    Names={};
    k=1;
    for i=1:size(Goals,1) 
        if(Goals(i)>= minV) &  (Goals(i)<= maxV)
            Names{k}=Players{i};
            fprintf('%s\n', Players{i});%% use { } to extract from CELL ARRAY
            k=k+1;
        end
    end
   
  else
        Names = 'Player not found...'
  end
  
  Result = Names; %GetPlayersNames(txt, data,[minV maxV]);
end

%% Given a pie (Group by Age)   
%% and returns the  vector (percentages) associated with groups. 
function Result = GetPie(data);
%Analysis Group by Age 
  
   Result=Percentages(data);
   labels = {'Low','Middle','High'};
            
   figure()
   title('Percentages of Players base of age');
   
   pie(Result, labels);
end

%% percentage of low age (0) or high age (2) or middle age (1) players:
function Percentage = Percentages(data)
  LI = (data(:, 1) <=25 );
  MI = (data(:, 1) >25  & data(:, 1)<30);
  HI = (data(:, 1) >=30 );
  
  Low = (sum(LI) /NumPlayers(data))* 100.0;
  Middle = (sum(MI) /NumPlayers(data))* 100.0;
  High = (sum(HI) /NumPlayers(data))* 100.0;
  Percentage=[Low Middle High];
end

