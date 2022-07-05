
% Show the LSI FIR Pedetrian Classification Database.
% © Daniel Olmeda 2012

function dshowLSIClassification(subset, class)
% Example: dshowLSIClassification('Test', 'neg')
% Subsect: 'Train' or 'Test'
% class: 'pos' or 'neg'

if (nargin<1)
    subset = 'Train';
end;
if (nargin<2)
    class = 'pos';
end;

if(strcmp(class, 'pos'))
    f = fullfile(subset, 'pos.lst');
elseif(strcmp(class, 'neg'))
    f = fullfile(subset, 'neg.lst');
else
    error('class should be pos or neg.');
end

% Show images
colormap(jet);
fid = fopen(f, 'r');
tline = fgetl(fid);
while ischar(tline)
    
    % Read, adjust and show image.
    I = imread(tline);
    imagesc(I, [31000 34000]);
    axis equal;
    
    pause(0.03);
    
    % Read new line of annotations list.
    tline = fgetl(fid);
end
%Close annotations list.
fclose(fid);
end