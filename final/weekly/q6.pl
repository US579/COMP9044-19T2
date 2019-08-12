#!/usr/bin/perl -w


@arr=<>;

foreach $line (@arr){
    #将所有小数点为4的去除
    $line =~ s/\.[0-4][0-9]*//g;
    $temp = $line;
    #把line里面大于.5的数字提取出来
    @nums = $line =~ /([0-9]+\.[5-9]+[0-9*])/g;
    if (@nums){
        foreach $n (@nums){
            # 保存pattern
            $tempp = $n;
            # 将大于.5的数字后的小数去掉,只提取整数部分
            $n =~ s/\..*//;
            # 整数部分+1
            $update_n = $n + 1;
            # 将pattern替换成+1后的数,不能用g,要一个一个替换,列表里的顺序和字符串里的顺序一致
            $temp =~ s/$tempp/$update_n/; 
        }
        print "$temp";
        next;
    }
    print $line;
}
