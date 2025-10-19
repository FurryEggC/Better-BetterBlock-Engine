/// scrArrayShuffle(array)
// returns shuffled array
arr = argument0;
arrlen = array_length_1d(arr);
rnd = array_create(arrlen);

for (var i = 0; i < arrlen; i++) rnd[i] = arr[i];

for (var i = 0; i < arrlen; i++) {
    var ind = irandom_range(i, arrlen - 1);
    var temp = rnd[i];
    rnd[i] = rnd[ind];
    rnd[ind] = temp;
}

return rnd;

