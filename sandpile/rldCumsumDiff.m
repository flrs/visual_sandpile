function out = rldCumsumDiff(vals,runlens)
% Divakar's solution to run-length decoding
% (http://stackoverflow.com/a/29079288/2778484)
clens = cumsum(runlens);
idx(clens(end))=0;
idx([1 clens(1:end-1)+1]) = diff([0 vals]);
out = cumsum(idx);
return