dtmc

const distance;
const st1 = 2;
const st2 = distance + 2;
const st3 = 2 * distance + 2;
const st4 = 3 * distance + 2;
const st5 = 4 * distance + 2;
const st6 = 5 * distance + 2;
const alpha = 5;

module timer
 t : [0..288];
 [tick] t < 250 -> (t' = t + 1); 
 [tick] t = 250 -> (t' = t);
endmodule

module train1
 loc1 : [0..60] init 0;
 delay1 : [0..20];
 [tick] t < st1 & loc1 = 0 -> (delay1' = 0);
 [tick] t = st1 & loc1 = 0 -> (loc1' = 1);
 [tick] loc1 >= 1 & loc1 < 12 & delay1 < 20 -> (1-alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);
 [tick] loc1 >= 1 & loc1 < 12 & delay1 = 20 -> (loc1' = loc1 + 1);
 [tick] loc1 = 12 -> (loc1' = 13);
 [tick] loc1 >= 13 & loc1 < 24 & delay1 < 20 -> (1-alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);
 [tick] loc1 >= 13 & loc1 < 24 & delay1 = 20 -> (loc1' = loc1 + 1);
 [tick] loc1 = 24 -> (loc1' = 25);
 [tick] loc1 >= 25 & loc1 < 36 & delay1 < 20 -> (1-alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);
 [tick] loc1 >= 25 & loc1 < 36 & delay1 = 20 -> (loc1' = loc1 + 1);
 [tick] loc1 = 36 -> (loc1' = 37);
 [tick] loc1 >= 37 & loc1 < 48 & delay1 < 20 -> (1-alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);
 [tick] loc1 >= 37 & loc1 < 48 & delay1 = 20 -> (loc1' = loc1 + 1);
 [tick] loc1 = 48 -> (loc1' = 49);
 [tick] loc1 >= 49 & loc1 < 60 & delay1 < 20 -> (1-alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);
 [tick] loc1 >= 49 & loc1 < 60 & delay1 = 20 -> (loc1' = loc1 + 1);
 [tick] loc1 = 60 -> (loc1' = 60);
endmodule
 
module train2
 loc2 : [0..60] init 0;
 delay2 : [0..20];
 dl2 : [0..20];
 [tick] t < st2 & loc2 = 0 -> (delay2' = 0);
 [tick] t >= st2 & loc2 = 0 & loc1 > 1 -> (loc2' = 1);
 [tick] t >= st2 & loc2 = 0 & loc1 = 1 -> (loc2' = 0);
 [tick] loc2 >= 1 & loc2 < 11 & loc1 - loc2 >= 2 & delay2 < 20 -> (1-alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 1 & loc2 < 11 & loc1 - loc2 < 2 & delay2 <= 20 & dl2 < 20 -> (dl2' = dl2 + 1);
 [tick] loc2 >= 1 & loc2 < 11 & loc1 - loc2 < 2 & delay2 <= 20 & dl2 = 20 -> (dl2' = dl2);
 [tick] loc1 >= 12 & loc2 = 11 & delay2 < 20 -> (1-alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 1 & loc2 < 11 & loc1 - loc2 >= 2 & delay2 = 20 -> (loc2' = loc2 + 1);
 [tick] loc1 >= 12 & loc2 = 11 & delay2 = 20 -> (loc2' = loc2 + 1);
 [tick] loc1 > 13 & loc2 = 12 -> (loc2' = 13);
 [tick] loc1 <= 13 & loc2 = 12 & dl2 < 20 -> (dl2' = dl2+1);
 [tick] loc1 <= 13 & loc2 = 12 & dl2 = 20 -> (dl2' = dl2);

 [tick] loc2 >= 13 & loc2 < 23 & loc1 - loc2 >= 2 & delay2 < 20 -> (1-alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 13 & loc2 < 23 & loc1 - loc2 < 2 & delay2 <= 20 & dl2 < 20 -> (dl2' = dl2+1);
 [tick] loc2 >= 13 & loc2 < 23 & loc1 - loc2 < 2 & delay2 <= 20 & dl2 = 20 -> (dl2' = dl2);
 [tick] loc1 >= 24 & loc2 = 23 & delay2 < 20 -> (1-alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 13 & loc2 < 23 & loc1 - loc2 >= 2 & delay2 = 20 -> (loc2' = loc2 + 1);
 [tick] loc1 >= 24 & loc2 = 23 & delay2 = 20 -> (loc2' = loc2 + 1);
 [tick] loc1 > 25 & loc2 = 24 -> (loc2' = 25);
 [tick] loc1 <= 25 & loc2 = 24 & dl2 < 20 -> (dl2' = dl2+1);

 [tick] loc2 >= 25 & loc2 < 35 & loc1 - loc2 >= 2 & delay2 < 20 -> (1-alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 25 & loc2 < 35 & loc1 - loc2 < 2 & delay2 <= 20 & dl2 < 20 -> (dl2' = dl2+1);
 [tick] loc1 >= 36 & loc2 = 35 & delay2 < 20 -> (1-alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 25 & loc2 < 35 & loc1 - loc2 >= 2 & delay2 = 20 -> (loc2' = loc2 + 1);
 [tick] loc1 >= 36 & loc2 = 35 & delay2 = 20 -> (loc2' = loc2 + 1);
 [tick] loc1 > 37 & loc2 = 36 -> (loc2' = 37);
 [tick] loc1 <= 37 & loc2 = 36 & dl2 < 20 -> (dl2' = dl2+1);

 [tick] loc2 >= 37 & loc2 < 47 & loc1 - loc2 >= 2 & delay2 < 20 -> (1-alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 37 & loc2 < 47 & loc1 - loc2 < 2 & delay2 <= 20  & dl2 < 20 -> (dl2' = dl2+1);
 [tick] loc1 >= 48 & loc2 = 47 & delay2 < 20 -> (1-alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 37 & loc2 < 47 & loc1 - loc2 >= 2 & delay2 = 20 -> (loc2' = loc2 + 1);
 [tick] loc1 >= 48 & loc2 = 47 & delay2 = 20 -> (loc2' = loc2 + 1);
 [tick] loc1 > 49 & loc2 = 48 -> (loc2' = 49);
 [tick] loc1 <= 49 & loc2 = 48 & dl2 < 20 -> (dl2' = dl2+1);

 [tick] loc2 >= 49 & loc2 < 59 & loc1 - loc2 >= 2 & delay2 < 20 -> (1-alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 49 & loc2 < 59 & loc1 - loc2 < 2 & delay2 <= 20 & dl2 < 20 -> (dl2' = dl2+1);
 [tick] loc1 >= 60 & loc2 = 59 & delay2 < 20 -> (1-alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 49 & loc2 < 59 & loc1 - loc2 >= 2 & delay2 = 20 -> (loc2' = loc2 + 1);
 [tick] loc1 >= 60 & loc2 = 59 & delay2 = 20 -> (loc2' = loc2 + 1);
 [tick] loc2 = 60 -> (loc2' = 60);
endmodule

module train3
 loc3 : [0..60] init 0;
 delay3 : [0..20];
 dl3 : [0..20];
 [tick] t < st3 & loc3 = 0 -> (delay3' = 0);
 [tick] t >= st3 & loc3 = 0 & loc2 > 1 -> (loc3' = 1);
 [tick] t >= st3 & loc3 = 0 & loc2 <= 1 -> (loc3' = 0);
 [tick] loc3 >= 1 & loc3 < 11 & loc2 - loc3 >= 2 & delay3 < 20 -> (1-alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 1 & loc3 < 11 & loc2 - loc3 < 2 & delay3 <= 20 & dl3 < 20 -> (dl3' = dl3 + 1);
 [tick] loc3 >= 1 & loc3 < 11 & loc2 - loc3 < 2 & delay3 <= 20 & dl3 = 20 -> (dl3' = dl3);
 [tick] loc2 >= 12 & loc3 = 11 & delay3 < 20 -> (1-alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 1 & loc3 < 11 & loc2 - loc3 >= 2 & delay3 = 20 -> (loc3' = loc3 + 1);
 [tick] loc2 >= 12 & loc3 = 11 & delay3 = 20 -> (loc3' = loc3 + 1);
 [tick] loc2 > 13 & loc3 = 12 -> (loc3' = 13);
 [tick] loc2 <= 13 & loc3 = 12 & dl3 < 20 -> (dl3' = dl3+1);
 [tick] loc2 <= 13 & loc3 = 12 & dl3 = 20 -> (dl3' = dl3);

 [tick] loc3 >= 13 & loc3 < 23 & loc2 - loc3 >= 2 & delay3 < 20 -> (1-alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 13 & loc3 < 23 & loc2 - loc3 < 2 & delay3 <= 20 & dl3 < 20 -> (dl3' = dl3+1);
 [tick] loc3 >= 13 & loc3 < 23 & loc2 - loc3 < 2 & delay3 <= 20 & dl3 = 20 -> (dl3' = dl3);
 [tick] loc2 >= 24 & loc3 = 23 & delay3 < 20 -> (1-alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 13 & loc3 < 23 & loc2 - loc3 >= 2 & delay3 = 20 -> (loc3' = loc3 + 1);
 [tick] loc2 >= 24 & loc3 = 23 & delay3 = 20 -> (loc3' = loc3 + 1);
 [tick] loc2 > 25 & loc3 = 24 -> (loc3' = 25);
 [tick] loc2 <= 25 & loc3 = 24 & dl3 < 20 -> (dl3' = dl3+1);

 [tick] loc3 >= 25 & loc3 < 35 & loc2 - loc3 >= 2 & delay3 < 20 -> (1-alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 25 & loc3 < 35 & loc2 - loc3 < 2 & delay3 <= 20 & dl3 < 20 -> (dl3' = dl3+1);
 [tick] loc2 >= 36 & loc3 = 35 & delay3 < 20 -> (1-alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 25 & loc3 < 35 & loc2 - loc3 >= 2 & delay3 = 20 -> (loc3' = loc3 + 1);
 [tick] loc2 >= 36 & loc3 = 35 & delay3 = 20 -> (loc3' = loc3 + 1);
 [tick] loc2 > 37 & loc3 = 36 -> (loc3' = 37);
 [tick] loc2 <= 37 & loc3 = 36 & dl3 < 20 -> (dl3' = dl3+1);

 [tick] loc3 >= 37 & loc3 < 47 & loc2 - loc3 >= 2 & delay3 < 20 -> (1-alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 37 & loc3 < 47 & loc2 - loc3 < 2 & delay3 <= 20  & dl3 < 20 -> (dl3' = dl3+1);
 [tick] loc2 >= 48 & loc3 = 47 & delay3 < 20 -> (1-alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 37 & loc3 < 47 & loc2 - loc3 >= 2 & delay3 = 20 -> (loc3' = loc3 + 1);
 [tick] loc2 >= 48 & loc3 = 47 & delay3 = 20 -> (loc3' = loc3 + 1);
 [tick] loc2 > 49 & loc3 = 48 -> (loc3' = 49);
 [tick] loc2 <= 49 & loc3 = 48 & dl3 < 20 -> (dl3' = dl3+1);

 [tick] loc3 >= 49 & loc3 < 59 & loc2 - loc3 >= 2 & delay3 < 20 -> (1-alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 49 & loc3 < 59 & loc2 - loc3 < 2 & delay3 <= 20 & dl3 < 20 -> (dl3' = dl3+1);
 [tick] loc2 >= 60 & loc3 = 59 & delay3 < 20 -> (1-alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 49 & loc3 < 59 & loc2 - loc3 >= 2 & delay3 = 20 -> (loc3' = loc3 + 1);
 [tick] loc2 >= 60 & loc3 = 59 & delay3 = 20 -> (loc3' = loc3 + 1);
 [tick] loc3 = 60 -> (loc3' = 60);
endmodule


module train4
 loc4 : [0..60] init 0;
 delay4 : [0..20];
 dl4 : [0..20];
 [tick] t < st4 & loc4 = 0 -> (delay4' = 0);
 [tick] t >= st4 & loc4 = 0 & loc3 > 1 -> (loc4' = 1);
 [tick] t >= st4 & loc4 = 0 & loc3 <= 1 -> (loc4' = 0);
 [tick] loc4 >= 1 & loc4 < 11 & loc3 - loc4 >= 2 & delay4 < 20 -> (1-alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 1 & loc4 < 11 & loc3 - loc4 < 2 & delay4 <= 20 & dl4 < 20 -> (dl4' = dl4 + 1);
 [tick] loc4 >= 1 & loc4 < 11 & loc3 - loc4 < 2 & delay4 <= 20 & dl4 = 20 -> (dl4' = dl4);
 [tick] loc3 >= 12 & loc4 = 11 & delay4 < 20 -> (1-alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 1 & loc4 < 11 & loc3 - loc4 >= 2 & delay4 = 20 -> (loc4' = loc4 + 1);
 [tick] loc3 >= 12 & loc4 = 11 & delay4 = 20 -> (loc4' = loc4 + 1);
 [tick] loc3 > 13 & loc4 = 12 -> (loc4' = 13);
 [tick] loc3 <= 13 & loc4 = 12 & dl4 < 20 -> (dl4' = dl4+1);
 [tick] loc3 <= 13 & loc4 = 12 & dl4 = 20 -> (dl4' = dl4);

 [tick] loc4 >= 13 & loc4 < 23 & loc3 - loc4 >= 2 & delay4 < 20 -> (1-alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 13 & loc4 < 23 & loc3 - loc4 < 2 & delay4 <= 20 & dl4 < 20 -> (dl4' = dl4+1);
 [tick] loc4 >= 13 & loc4 < 23 & loc3 - loc4 < 2 & delay4 <= 20 & dl4 = 20 -> (dl4' = dl4);
 [tick] loc3 >= 24 & loc4 = 23 & delay4 < 20 -> (1-alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 13 & loc4 < 23 & loc3 - loc4 >= 2 & delay4 = 20 -> (loc4' = loc4 + 1);
 [tick] loc3 >= 24 & loc4 = 23 & delay4 = 20 -> (loc4' = loc4 + 1);
 [tick] loc3 > 25 & loc4 = 24 -> (loc4' = 25);
 [tick] loc3 <= 25 & loc4 = 24 & dl4 < 20 -> (dl4' = dl4+1);

 [tick] loc4 >= 25 & loc4 < 35 & loc3 - loc4 >= 2 & delay4 < 20 -> (1-alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 25 & loc4 < 35 & loc3 - loc4 < 2 & delay4 <= 20 & dl4 < 20 -> (dl4' = dl4+1);
 [tick] loc3 >= 36 & loc4 = 35 & delay4 < 20 -> (1-alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 25 & loc4 < 35 & loc3 - loc4 >= 2 & delay4 = 20 -> (loc4' = loc4 + 1);
 [tick] loc3 >= 36 & loc4 = 35 & delay4 = 20 -> (loc4' = loc4 + 1);
 [tick] loc3 > 37 & loc4 = 36 -> (loc4' = 37);
 [tick] loc3 <= 37 & loc4 = 36 & dl4 < 20 -> (dl4' = dl4+1);

 [tick] loc4 >= 37 & loc4 < 47 & loc3 - loc4 >= 2 & delay4 < 20 -> (1-alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 37 & loc4 < 47 & loc3 - loc4 < 2 & delay4 <= 20  & dl4 < 20 -> (dl4' = dl4+1);
 [tick] loc3 >= 48 & loc4 = 47 & delay4 < 20 -> (1-alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 37 & loc4 < 47 & loc3 - loc4 >= 2 & delay4 = 20 -> (loc4' = loc4 + 1);
 [tick] loc3 >= 48 & loc4 = 47 & delay4 = 20 -> (loc4' = loc4 + 1);
 [tick] loc3 > 49 & loc4 = 48 -> (loc4' = 49);
 [tick] loc3 <= 49 & loc4 = 48 & dl4 < 20 -> (dl4' = dl4+1);

 [tick] loc4 >= 49 & loc4 < 59 & loc3 - loc4 >= 2 & delay4 < 20 -> (1-alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 49 & loc4 < 59 & loc3 - loc4 < 2 & delay4 <= 20 & dl4 < 20 -> (dl4' = dl4+1);
 [tick] loc3 >= 60 & loc4 = 59 & delay4 < 20 -> (1-alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 49 & loc4 < 59 & loc3 - loc4 >= 2 & delay4 = 20 -> (loc4' = loc4 + 1);
 [tick] loc3 >= 60 & loc4 = 59 & delay4 = 20 -> (loc4' = loc4 + 1);
 [tick] loc4 = 60 -> (loc4' = 60);
endmodule

module train5
 loc5 : [0..60] init 0;
 delay5 : [0..20];
 dl5 : [0..20];
 [tick] t < st5 & loc5 = 0 -> (delay5' = 0);
 [tick] t >= st5 & loc5 = 0 & loc4 > 1 -> (loc5' = 1);
 [tick] t >= st5 & loc5 = 0 & loc4 <= 1 -> (loc5' = 0);
 [tick] loc5 >= 1 & loc5 < 11 & loc4 - loc5 >= 2 & delay5 < 20 -> (1-alpha/100):(loc5' = loc5 + 1) + alpha/100:(delay5' = delay5+1);
 [tick] loc5 >= 1 & loc5 < 11 & loc4 - loc5 < 2 & delay5 <= 20 & dl5 < 20 -> (dl5' = dl5 + 1);
 [tick] loc5 >= 1 & loc5 < 11 & loc4 - loc5 < 2 & delay5 <= 20 & dl5 = 20 -> (dl5' = dl5);
 [tick] loc4 >= 12 & loc5 = 11 & delay5 < 20 -> (1-alpha/100):(loc5' = loc5 + 1) + alpha/100:(delay5' = delay5+1);
 [tick] loc5 >= 1 & loc5 < 11 & loc4 - loc5 >= 2 & delay5 = 20 -> (loc5' = loc5 + 1);
 [tick] loc4 >= 12 & loc5 = 11 & delay5 = 20 -> (loc5' = loc5 + 1);
 [tick] loc4 > 13 & loc5 = 12 -> (loc5' = 13);
 [tick] loc4 <= 13 & loc5 = 12 & dl5 < 20 -> (dl5' = dl5+1);
 [tick] loc4 <= 13 & loc5 = 12 & dl5 = 20 -> (dl5' = dl5);

 [tick] loc5 >= 13 & loc5 < 23 & loc4 - loc5 >= 2 & delay5 < 20 -> (1-alpha/100):(loc5' = loc5 + 1) + alpha/100:(delay5' = delay5+1);
 [tick] loc5 >= 13 & loc5 < 23 & loc4 - loc5 < 2 & delay5 <= 20 & dl5 < 20 -> (dl5' = dl5+1);
 [tick] loc5 >= 13 & loc5 < 23 & loc4 - loc5 < 2 & delay5 <= 20 & dl5 = 20 -> (dl5' = dl5);
 [tick] loc4 >= 24 & loc5 = 23 & delay5 < 20 -> (1-alpha/100):(loc5' = loc5 + 1) + alpha/100:(delay5' = delay5+1);
 [tick] loc5 >= 13 & loc5 < 23 & loc4 - loc5 >= 2 & delay5 = 20 -> (loc5' = loc5 + 1);
 [tick] loc4 >= 24 & loc5 = 23 & delay5 = 20 -> (loc5' = loc5 + 1);
 [tick] loc4 > 25 & loc5 = 24 -> (loc5' = 25);
 [tick] loc4 <= 25 & loc5 = 24 & dl5 < 20 -> (dl5' = dl5+1);

 [tick] loc5 >= 25 & loc5 < 35 & loc4 - loc5 >= 2 & delay5 < 20 -> (1-alpha/100):(loc5' = loc5 + 1) + alpha/100:(delay5' = delay5+1);
 [tick] loc5 >= 25 & loc5 < 35 & loc4 - loc5 < 2 & delay5 <= 20 & dl5 < 20 -> (dl5' = dl5+1);
 [tick] loc4 >= 36 & loc5 = 35 & delay5 < 20 -> (1-alpha/100):(loc5' = loc5 + 1) + alpha/100:(delay5' = delay5+1);
 [tick] loc5 >= 25 & loc5 < 35 & loc4 - loc5 >= 2 & delay5 = 20 -> (loc5' = loc5 + 1);
 [tick] loc4 >= 36 & loc5 = 35 & delay5 = 20 -> (loc5' = loc5 + 1);
 [tick] loc4 > 37 & loc5 = 36 -> (loc5' = 37);
 [tick] loc4 <= 37 & loc5 = 36 & dl5 < 20 -> (dl5' = dl5+1);

 [tick] loc5 >= 37 & loc5 < 47 & loc4 - loc5 >= 2 & delay5 < 20 -> (1-alpha/100):(loc5' = loc5 + 1) + alpha/100:(delay5' = delay5+1);
 [tick] loc5 >= 37 & loc5 < 47 & loc4 - loc5 < 2 & delay5 <= 20  & dl5 < 20 -> (dl5' = dl5+1);
 [tick] loc4 >= 48 & loc5 = 47 & delay5 < 20 -> (1-alpha/100):(loc5' = loc5 + 1) + alpha/100:(delay5' = delay5+1);
 [tick] loc5 >= 37 & loc5 < 47 & loc4 - loc5 >= 2 & delay5 = 20 -> (loc5' = loc5 + 1);
 [tick] loc4 >= 48 & loc5 = 47 & delay5 = 20 -> (loc5' = loc5 + 1);
 [tick] loc4 > 49 & loc5 = 48 -> (loc5' = 49);
 [tick] loc4 <= 49 & loc5 = 48 & dl5 < 20 -> (dl5' = dl5+1);

 [tick] loc5 >= 49 & loc5 < 59 & loc4 - loc5 >= 2 & delay5 < 20 -> (1-alpha/100):(loc5' = loc5 + 1) + alpha/100:(delay5' = delay5+1);
 [tick] loc5 >= 49 & loc5 < 59 & loc4 - loc5 < 2 & delay5 <= 20 & dl5 < 20 -> (dl5' = dl5+1);
 [tick] loc4 >= 60 & loc5 = 59 & delay5 < 20 -> (1-alpha/100):(loc5' = loc5 + 1) + alpha/100:(delay5' = delay5+1);
 [tick] loc5 >= 49 & loc5 < 59 & loc4 - loc5 >= 2 & delay5 = 20 -> (loc5' = loc5 + 1);
 [tick] loc4 >= 60 & loc5 = 59 & delay5 = 20 -> (loc5' = loc5 + 1);
 [tick] loc5 = 60 -> (loc5' = 60);
endmodule

module train6
 loc6 : [0..60] init 0;
 delay6 : [0..20];
 dl6 : [0..20];
 [tick] t < st6 & loc6 = 0 -> (delay6' = 0);
 [tick] t >= st6 & loc6 = 0 & loc5 > 1 -> (loc6' = 1);
 [tick] t >= st6 & loc6 = 0 & loc5 <= 1 -> (loc6' = 0);
 [tick] loc6 >= 1 & loc6 < 11 & loc5 - loc6 >= 2 & delay6 < 20 -> (1-alpha/100):(loc6' = loc6 + 1) + alpha/100:(delay6' = delay6+1);
 [tick] loc6 >= 1 & loc6 < 11 & loc5 - loc6 < 2 & delay6 <= 20 & dl6 < 20 -> (dl6' = dl6 + 1);
 [tick] loc6 >= 1 & loc6 < 11 & loc5 - loc6 < 2 & delay6 <= 20 & dl6 = 20 -> (dl6' = dl6);
 [tick] loc5 >= 12 & loc6 = 11 & delay6 < 20 -> (1-alpha/100):(loc6' = loc6 + 1) + alpha/100:(delay6' = delay6+1);
 [tick] loc6 >= 1 & loc6 < 11 & loc5 - loc6 >= 2 & delay6 = 20 -> (loc6' = loc6 + 1);
 [tick] loc5 >= 12 & loc6 = 11 & delay6 = 20 -> (loc6' = loc6 + 1);
 [tick] loc5 > 13 & loc6 = 12 -> (loc6' = 13);
 [tick] loc5 <= 13 & loc6 = 12 & dl6 < 20 -> (dl6' = dl6+1);
 [tick] loc5 <= 13 & loc6 = 12 & dl6 = 20 -> (dl6' = dl6);

 [tick] loc6 >= 13 & loc6 < 23 & loc5 - loc6 >= 2 & delay6 < 20 -> (1-alpha/100):(loc6' = loc6 + 1) + alpha/100:(delay6' = delay6+1);
 [tick] loc6 >= 13 & loc6 < 23 & loc5 - loc6 < 2 & delay6 <= 20 & dl6 < 20 -> (dl6' = dl6+1);
 [tick] loc6 >= 13 & loc6 < 23 & loc5 - loc6 < 2 & delay6 <= 20 & dl6 = 20 -> (dl6' = dl6);
 [tick] loc5 >= 24 & loc6 = 23 & delay6 < 20 -> (1-alpha/100):(loc6' = loc6 + 1) + alpha/100:(delay6' = delay6+1);
 [tick] loc6 >= 13 & loc6 < 23 & loc5 - loc6 >= 2 & delay6 = 20 -> (loc6' = loc6 + 1);
 [tick] loc5 >= 24 & loc6 = 23 & delay6 = 20 -> (loc6' = loc6 + 1);
 [tick] loc5 > 25 & loc6 = 24 -> (loc6' = 25);
 [tick] loc5 <= 25 & loc6 = 24 & dl6 < 20 -> (dl6' = dl6+1);

 [tick] loc6 >= 25 & loc6 < 35 & loc5 - loc6 >= 2 & delay6 < 20 -> (1-alpha/100):(loc6' = loc6 + 1) + alpha/100:(delay6' = delay6+1);
 [tick] loc6 >= 25 & loc6 < 35 & loc5 - loc6 < 2 & delay6 <= 20 & dl6 < 20 -> (dl6' = dl6+1);
 [tick] loc5 >= 36 & loc6 = 35 & delay6 < 20 -> (1-alpha/100):(loc6' = loc6 + 1) + alpha/100:(delay6' = delay6+1);
 [tick] loc6 >= 25 & loc6 < 35 & loc5 - loc6 >= 2 & delay6 = 20 -> (loc6' = loc6 + 1);
 [tick] loc5 >= 36 & loc6 = 35 & delay6 = 20 -> (loc6' = loc6 + 1);
 [tick] loc5 > 37 & loc6 = 36 -> (loc6' = 37);
 [tick] loc5 <= 37 & loc6 = 36 & dl6 < 20 -> (dl6' = dl6+1);

 [tick] loc6 >= 37 & loc6 < 47 & loc5 - loc6 >= 2 & delay6 < 20 -> (1-alpha/100):(loc6' = loc6 + 1) + alpha/100:(delay6' = delay6+1);
 [tick] loc6 >= 37 & loc6 < 47 & loc5 - loc6 < 2 & delay6 <= 20  & dl6 < 20 -> (dl6' = dl6+1);
 [tick] loc5 >= 48 & loc6 = 47 & delay6 < 20 -> (1-alpha/100):(loc6' = loc6 + 1) + alpha/100:(delay6' = delay6+1);
 [tick] loc6 >= 37 & loc6 < 47 & loc5 - loc6 >= 2 & delay6 = 20 -> (loc6' = loc6 + 1);
 [tick] loc5 >= 48 & loc6 = 47 & delay6 = 20 -> (loc6' = loc6 + 1);
 [tick] loc5 > 49 & loc6 = 48 -> (loc6' = 49);
 [tick] loc5 <= 49 & loc6 = 48 & dl6 < 20 -> (dl6' = dl6+1);

 [tick] loc6 >= 49 & loc6 < 59 & loc5 - loc6 >= 2 & delay6 < 20 -> (1-alpha/100):(loc6' = loc6 + 1) + alpha/100:(delay6' = delay6+1);
 [tick] loc6 >= 49 & loc6 < 59 & loc5 - loc6 < 2 & delay6 <= 20 & dl6 < 20 -> (dl6' = dl6+1);
 [tick] loc5 >= 60 & loc6 = 59 & delay6 < 20 -> (1-alpha/100):(loc6' = loc6 + 1) + alpha/100:(delay6' = delay6+1);
 [tick] loc6 >= 49 & loc6 < 59 & loc5 - loc6 >= 2 & delay6 = 20 -> (loc6' = loc6 + 1);
 [tick] loc5 >= 60 & loc6 = 59 & delay6 = 20 -> (loc6' = loc6 + 1);
 [tick] loc6 = 60 -> (loc6' = 60);
endmodule

module ckrew
 ck :[0..2] init 0;
 [tt] ck <= 1 & loc1 = 60 & loc2 = 60 & loc3 = 60 & loc4 = 60 & loc5 = 60 & loc6 = 60 -> (ck' = ck + 1);
endmodule

rewards
// [tt] ck = 1 : delay1 + delay2 + delay3 + delay4 + delay5 + delay6;
[tt] ck = 1 : dl2 + dl3 + dl4 + dl5 + dl6;
endrewards

label "fin" = t >= 240;
label "progdel2" = t >= 240 & loc1 = 60 & loc2 = 60 & loc3 = 60 & loc4 = 60 & loc5 = 60 & loc6 = 60 & dl2 + dl3 + dl4 + dl5 + dl6 <= 2;
label "progdel6" = t >= 240 & loc1 = 60 & loc2 = 60 & loc3 = 60 & loc4 = 60 & loc5 = 60 & loc6 = 60 & dl2 + dl3 + dl4 + dl5 + dl6 <= 6;
label "progdel10" = t >= 240 & loc1 = 60 & loc2 = 60 & loc3 = 60 & loc4 = 60 & loc5 = 60 & loc6 = 60 & dl2 + dl3 + dl4 + dl5 + dl6 <= 10;

