#!/usr/bin/perl -w

@list=<>;
@randlist =();
while (@randlist <= $#list){
    $index=int(rand($#list+1));
    if ( grep { $_ eq $index } @randlist ){
        next;
    }else{
    push(@randlist,$index);
 }
}


for ($i=0;$i<@randlist;$i++){
    print "$list[$randlist[$i]]";
}

#print splice(@list,rand(@list),1) while @list;
