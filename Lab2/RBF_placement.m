function [ output_args ] = RBF_placement(algo,singlewinner,units )

units =2;

plotinit
data =  read('cluster');

if (nargin<3)
    units = 5;
end
if (nargin<2)
    singlewinner = 1;
end

vqinit;

if strcmp(algo, 'cl') == 1
    vqstep;
    vqiter;
end

if strcmp(algo, 'em') == 1
    emstepb;
    emiterb;
end




end

