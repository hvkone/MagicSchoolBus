%% Magic School Bus Game
%% Clean House
clc; close all; format short;
%% Credentials
human_name = 'Who''s riding the bus today? (enter name)';
dlgtitle = 'Let''s Ride the Magic School Bus';
dims = [1 75];
human = inputdlg(human_name,dlgtitle,dims);
human = cell2mat(human);
%% Creating Variable Array via Prompt
prompt1 = 'Type Any Number';
dlgtitle1 = 'Stage 1 of 4';
dims1 = [1 75];
number = inputdlg(prompt1,dlgtitle1,dims1);
number = str2double(number);

x = (1 : number)';

%% Guess the type of the random number
rand1 = randi(number,1);

prompt2 = 'Guess Whether the Next Randomly Selected Number is Even or Odd (type even or odd)';
dlgtitle2 = 'Stage 2 of 4';
dims2 = [1 100];
evenodd = inputdlg(prompt2,dlgtitle2,dims2);
evenodd = cell2mat(evenodd);

% Determine if even
even_vars = (x(2) : 2 : x(end))';
% Determine if odd
odd_vars = (x(1) : 2 : x(end))';

% Check if the random number is even or odd
switch evenodd
    case 'even'
        if ismember(rand1,even_vars)
        else
            fig = uifigure;
            uialert(fig,sprintf('YOU GUESS INCORRECTLY! The number was %d.',rand1),'FAILED','Icon','error');
        return
        end
    case 'odd'
        if ismember(rand1,odd_vars)
        else
            fig = uifigure;
            uialert(fig,sprintf('YOU GUESS INCORRECTLY! The number was %d.',rand1),'FAILED','Icon','error');
        return
        end

end

%% Guess higher or lower than the random number picked
disp(rand1)
prompt3 = 'Guess Whether the Next Randomly Selected Number Higher or Lower than the Last Number (type high or low)';
dlgtitle3 = 'Stage 3 of 4';
dims3 = [1 125];
highlow = inputdlg(prompt3,dlgtitle3,dims3);
highlow = cell2mat(highlow);

rand2 = randi(number,1);

switch highlow
    case 'high'
        if rand2 > rand1
        else
            fig = uifigure;
            uialert(fig,sprintf('YOU GUESS INCORRECTLY! The number was %d.',rand2),'FAILED','Icon','error');
            return
        end
    case 'low'
        if rand2 < rand1
        else
            fig = uifigure;
            uialert(fig,sprintf('YOU GUESS INCORRECTLY! The number was %d.',rand2),'FAILED','Icon','error');
            return
        end

end

%% Guess the where the next random number is lies
disp(rand2)
% Build array of random number 1 and random number 2
if rand1 > rand2
    in = (rand2:rand1)';
    topout = (1:rand2)'; botout = (rand1:number)';
    out = union(topout,botout);
else
    in = (rand1:rand2)';
    topout = (1:rand1)'; botout = (rand2:number)';
    out = union(topout,botout);
end

rand3 = randi(number,1);

prompt4 = 'Guess Whether the Next Randomly Selected Number Inside or Outside of the First Two Numbers (type in or out)';
dlgtitle4 = 'Stage 4 of 4';
dims4 = [1 125];
inout = inputdlg(prompt4,dlgtitle4,dims4); 
inout = cell2mat(inout);

switch inout
    case 'in'
        if ismember(rand3,in)
            fig = uifigure;
            uialert(fig,'YOU HAVE SUCESSFULLY MADE IT OFF THE MAGIC SCHOOL BUS!',sprintf('CONGRATULATIONS %s!',human),'Icon','success');
        else
            fig = uifigure;
            uialert(fig,sprintf('YOU GUESS INCORRECTLY! The number was %d.',rand3),'FAILED','Icon','error');
            return
        end
    case 'out'
        if ismember(rand3,out)
            fig = uifigure;
            uialert(fig,'YOU HAVE SUCESSFULLY MADE IT OFF THE MAGIC SCHOOL BUS!',sprintf('CONGRATULATIONS %s!',human),'Icon','success');
        else
            fig = uifigure;
            uialert(fig,sprintf('YOU GUESS INCORRECTLY! The number was %d.',rand3),'FAILED','Icon','error');
            return
        end

end