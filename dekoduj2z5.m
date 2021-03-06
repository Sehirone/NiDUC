function [IsReceived, uncodedData] = dekoduj2z5( receivedPacket )
%DEKODUJ2Z5 Summary of this function goes here
%   Detailed explanation goes here
%   Dekoder wektora zakodowanego kodem 2 z 5
%   przyjmuje wektor/pakiet o d�ugo�ci n
%   Zwraca wektor o d�ugo�ci n/5 + 1
%   pierwszy bit informuje o tym, czy zakodowane dane
%   uleg�y zniszczeniu podczas transmisji

[~, n] = size(receivedPacket);
numberOfBits= n/5;
uncodedData = zeros(1, numberOfBits);
IsReceived = true;
codedOne = [1 0 1 0 0];
codedZero = [1 1 0 0 0];

for i=1:numberOfBits
    przedzial = [(5*(i-1))+1 (5*i)];
    codedBit = receivedPacket(1,przedzial(1):przedzial(2));
    if isequal(codedBit, codedZero)
       uncodedData(i) = 0; 
    elseif isequal(codedBit, codedOne)
       uncodedData(i) = 1;
    else
       uncodedData(i) = 1;
       IsReceived = false;
    end
end    
end

