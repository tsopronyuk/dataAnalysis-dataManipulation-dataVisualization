clear;
close all;
clc;

 filename = 'Players.xlsx';
 fprintf('** Players Analysis Program **\n');
 fprintf('\n');
   
    
    analysis = menu('Pick an analysis', ... 
           'Stats', ...
          'Get Points', ...
          'Players Top10 Histogram (Points,Ages)', ...
          'Players Top10 Histogram (Goals,Ages)', ...
          'Get Players in Range', ... 
          'View Players by Age', ... 
           'Exit') ;
     
     
          
    while (analysis > 0) && (analysis < 7)
        if(analysis==1) %stats
            fprintf('Total # of players: %d\n',  PlayersAnalysis(filename,1));
            fprintf('Average of goals: %f\n',  PlayersAnalysis(filename,2));
            fprintf('Average player age: %f\n',  PlayersAnalysis(filename,4));
            fprintf('Min of age: %d\n',  PlayersAnalysis(filename,8));
            fprintf('Max of age: %d\n',  PlayersAnalysis(filename,9));
            
            
        end
        
        if(analysis==2) %Get points of players
            res=PlayersAnalysis(filename,3);
            
        end
        
         
        if(analysis==3) %%PlayersTop10Histogram
             PlayersAnalysis(filename,5);      
        end
        if(analysis==4) %%PlayersTop10Histogram1
             PlayersAnalysis(filename,7)      
        end
        
         if(analysis==5) %Get Players In Range
             PlayersAnalysis(filename,6);
         end
         
         if(analysis==6) %Analysis Group by Age 
             PlayersAnalysis(filename,10);
         end
         
   
   
    analysis = menu('Pick an analysis', ... 
           'Stats', ...
          'Get Points', ...
          'Players Top10 Histogram (Points,Ages)', ...
          'Players Top10 Histogram (Goals,Ages)', ...
          'Get Players in Range', ... 
          'View Players by Age', ...          
          'Exit') ;
    end
      fprintf('\n');
      fprintf('** Done **\n');

   


