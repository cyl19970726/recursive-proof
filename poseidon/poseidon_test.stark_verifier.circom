pragma circom 2.1.0;
pragma custom_templates;

include "cmul.circom";
include "cinv.circom";
include "poseidon.circom";
include "bitify.circom";
include "fft.circom";
include "merklehash.circom";
include "evalpol.circom";
include "treeselector.circom";





template VerifyEvaluations() {
    signal input challenges[8][3];
    signal input evals[59][3];
    signal input publics[0];
    signal input enable;

    component zMul[8];
    for (var i=0; i< 8 ; i++) {
        zMul[i] = CMul();
        if (i==0) {
            zMul[i].ina[0] <== challenges[7][0];
            zMul[i].ina[1] <== challenges[7][1];
            zMul[i].ina[2] <== challenges[7][2];
            zMul[i].inb[0] <== challenges[7][0];
            zMul[i].inb[1] <== challenges[7][1];
            zMul[i].inb[2] <== challenges[7][2];
        } else {
            zMul[i].ina[0] <== zMul[i-1].out[0];
            zMul[i].ina[1] <== zMul[i-1].out[1];
            zMul[i].ina[2] <== zMul[i-1].out[2];
            zMul[i].inb[0] <== zMul[i-1].out[0];
            zMul[i].inb[1] <== zMul[i-1].out[1];
            zMul[i].inb[2] <== zMul[i-1].out[2];
        }
    }

    signal Z[3];

    Z[0] <== zMul[7].out[0] -1;
    Z[1] <== zMul[7].out[1];
    Z[2] <== zMul[7].out[2];

        signal tmp_403[3];

    tmp_403[0] <== evals[0][0] + evals[1][0];
    tmp_403[1] <== evals[0][1] + evals[1][1];
    tmp_403[2] <== evals[0][2] + evals[1][2];
    signal tmp_404[3];

    component cmul_0 = CMul();
    cmul_0.ina[0] <== tmp_403[0];
    cmul_0.ina[1] <== tmp_403[1];
    cmul_0.ina[2] <== tmp_403[2];
    cmul_0.inb[0] <== tmp_403[0];
    cmul_0.inb[1] <== tmp_403[1];
    cmul_0.inb[2] <== tmp_403[2];
    tmp_404[0] <== cmul_0.out[0];
    tmp_404[1] <== cmul_0.out[1];
    tmp_404[2] <== cmul_0.out[2];
    signal tmp_405[3];

    component cmul_1 = CMul();
    cmul_1.ina[0] <== tmp_404[0];
    cmul_1.ina[1] <== tmp_404[1];
    cmul_1.ina[2] <== tmp_404[2];
    cmul_1.inb[0] <== tmp_404[0];
    cmul_1.inb[1] <== tmp_404[1];
    cmul_1.inb[2] <== tmp_404[2];
    tmp_405[0] <== cmul_1.out[0];
    tmp_405[1] <== cmul_1.out[1];
    tmp_405[2] <== cmul_1.out[2];
    signal tmp_406[3];

    component cmul_2 = CMul();
    cmul_2.ina[0] <== tmp_404[0];
    cmul_2.ina[1] <== tmp_404[1];
    cmul_2.ina[2] <== tmp_404[2];
    cmul_2.inb[0] <== tmp_405[0];
    cmul_2.inb[1] <== tmp_405[1];
    cmul_2.inb[2] <== tmp_405[2];
    tmp_406[0] <== cmul_2.out[0];
    tmp_406[1] <== cmul_2.out[1];
    tmp_406[2] <== cmul_2.out[2];
    signal tmp_407[3];

    component cmul_3 = CMul();
    cmul_3.ina[0] <== tmp_406[0];
    cmul_3.ina[1] <== tmp_406[1];
    cmul_3.ina[2] <== tmp_406[2];
    cmul_3.inb[0] <== tmp_403[0];
    cmul_3.inb[1] <== tmp_403[1];
    cmul_3.inb[2] <== tmp_403[2];
    tmp_407[0] <== cmul_3.out[0];
    tmp_407[1] <== cmul_3.out[1];
    tmp_407[2] <== cmul_3.out[2];
    signal tmp_408[3];

    tmp_408[0] <== tmp_407[0];
    tmp_408[1] <== tmp_407[1];
    tmp_408[2] <== tmp_407[2];
    signal tmp_409[3];

    tmp_409[0] <== evals[2][0] + evals[3][0];
    tmp_409[1] <== evals[2][1] + evals[3][1];
    tmp_409[2] <== evals[2][2] + evals[3][2];
    signal tmp_410[3];

    component cmul_4 = CMul();
    cmul_4.ina[0] <== tmp_409[0];
    cmul_4.ina[1] <== tmp_409[1];
    cmul_4.ina[2] <== tmp_409[2];
    cmul_4.inb[0] <== tmp_409[0];
    cmul_4.inb[1] <== tmp_409[1];
    cmul_4.inb[2] <== tmp_409[2];
    tmp_410[0] <== cmul_4.out[0];
    tmp_410[1] <== cmul_4.out[1];
    tmp_410[2] <== cmul_4.out[2];
    signal tmp_411[3];

    component cmul_5 = CMul();
    cmul_5.ina[0] <== tmp_410[0];
    cmul_5.ina[1] <== tmp_410[1];
    cmul_5.ina[2] <== tmp_410[2];
    cmul_5.inb[0] <== tmp_410[0];
    cmul_5.inb[1] <== tmp_410[1];
    cmul_5.inb[2] <== tmp_410[2];
    tmp_411[0] <== cmul_5.out[0];
    tmp_411[1] <== cmul_5.out[1];
    tmp_411[2] <== cmul_5.out[2];
    signal tmp_412[3];

    component cmul_6 = CMul();
    cmul_6.ina[0] <== tmp_410[0];
    cmul_6.ina[1] <== tmp_410[1];
    cmul_6.ina[2] <== tmp_410[2];
    cmul_6.inb[0] <== tmp_411[0];
    cmul_6.inb[1] <== tmp_411[1];
    cmul_6.inb[2] <== tmp_411[2];
    tmp_412[0] <== cmul_6.out[0];
    tmp_412[1] <== cmul_6.out[1];
    tmp_412[2] <== cmul_6.out[2];
    signal tmp_413[3];

    component cmul_7 = CMul();
    cmul_7.ina[0] <== tmp_412[0];
    cmul_7.ina[1] <== tmp_412[1];
    cmul_7.ina[2] <== tmp_412[2];
    cmul_7.inb[0] <== tmp_409[0];
    cmul_7.inb[1] <== tmp_409[1];
    cmul_7.inb[2] <== tmp_409[2];
    tmp_413[0] <== cmul_7.out[0];
    tmp_413[1] <== cmul_7.out[1];
    tmp_413[2] <== cmul_7.out[2];
    signal tmp_0[3];

    tmp_0[0] <== tmp_409[0] - tmp_413[0];
    tmp_0[1] <== tmp_409[1] - tmp_413[1];
    tmp_0[2] <== tmp_409[2] - tmp_413[2];
    signal tmp_1[3];

    component cmul_8 = CMul();
    cmul_8.ina[0] <== evals[4][0];
    cmul_8.ina[1] <== evals[4][1];
    cmul_8.ina[2] <== evals[4][2];
    cmul_8.inb[0] <== tmp_0[0];
    cmul_8.inb[1] <== tmp_0[1];
    cmul_8.inb[2] <== tmp_0[2];
    tmp_1[0] <== cmul_8.out[0];
    tmp_1[1] <== cmul_8.out[1];
    tmp_1[2] <== cmul_8.out[2];
    signal tmp_414[3];

    tmp_414[0] <== tmp_1[0] + tmp_413[0];
    tmp_414[1] <== tmp_1[1] + tmp_413[1];
    tmp_414[2] <== tmp_1[2] + tmp_413[2];
    signal tmp_415[3];

    tmp_415[0] <== evals[5][0] + evals[6][0];
    tmp_415[1] <== evals[5][1] + evals[6][1];
    tmp_415[2] <== evals[5][2] + evals[6][2];
    signal tmp_416[3];

    component cmul_9 = CMul();
    cmul_9.ina[0] <== tmp_415[0];
    cmul_9.ina[1] <== tmp_415[1];
    cmul_9.ina[2] <== tmp_415[2];
    cmul_9.inb[0] <== tmp_415[0];
    cmul_9.inb[1] <== tmp_415[1];
    cmul_9.inb[2] <== tmp_415[2];
    tmp_416[0] <== cmul_9.out[0];
    tmp_416[1] <== cmul_9.out[1];
    tmp_416[2] <== cmul_9.out[2];
    signal tmp_417[3];

    component cmul_10 = CMul();
    cmul_10.ina[0] <== tmp_416[0];
    cmul_10.ina[1] <== tmp_416[1];
    cmul_10.ina[2] <== tmp_416[2];
    cmul_10.inb[0] <== tmp_416[0];
    cmul_10.inb[1] <== tmp_416[1];
    cmul_10.inb[2] <== tmp_416[2];
    tmp_417[0] <== cmul_10.out[0];
    tmp_417[1] <== cmul_10.out[1];
    tmp_417[2] <== cmul_10.out[2];
    signal tmp_418[3];

    component cmul_11 = CMul();
    cmul_11.ina[0] <== tmp_416[0];
    cmul_11.ina[1] <== tmp_416[1];
    cmul_11.ina[2] <== tmp_416[2];
    cmul_11.inb[0] <== tmp_417[0];
    cmul_11.inb[1] <== tmp_417[1];
    cmul_11.inb[2] <== tmp_417[2];
    tmp_418[0] <== cmul_11.out[0];
    tmp_418[1] <== cmul_11.out[1];
    tmp_418[2] <== cmul_11.out[2];
    signal tmp_419[3];

    component cmul_12 = CMul();
    cmul_12.ina[0] <== tmp_418[0];
    cmul_12.ina[1] <== tmp_418[1];
    cmul_12.ina[2] <== tmp_418[2];
    cmul_12.inb[0] <== tmp_415[0];
    cmul_12.inb[1] <== tmp_415[1];
    cmul_12.inb[2] <== tmp_415[2];
    tmp_419[0] <== cmul_12.out[0];
    tmp_419[1] <== cmul_12.out[1];
    tmp_419[2] <== cmul_12.out[2];
    signal tmp_2[3];

    tmp_2[0] <== tmp_415[0] - tmp_419[0];
    tmp_2[1] <== tmp_415[1] - tmp_419[1];
    tmp_2[2] <== tmp_415[2] - tmp_419[2];
    signal tmp_3[3];

    component cmul_13 = CMul();
    cmul_13.ina[0] <== evals[4][0];
    cmul_13.ina[1] <== evals[4][1];
    cmul_13.ina[2] <== evals[4][2];
    cmul_13.inb[0] <== tmp_2[0];
    cmul_13.inb[1] <== tmp_2[1];
    cmul_13.inb[2] <== tmp_2[2];
    tmp_3[0] <== cmul_13.out[0];
    tmp_3[1] <== cmul_13.out[1];
    tmp_3[2] <== cmul_13.out[2];
    signal tmp_420[3];

    tmp_420[0] <== tmp_3[0] + tmp_419[0];
    tmp_420[1] <== tmp_3[1] + tmp_419[1];
    tmp_420[2] <== tmp_3[2] + tmp_419[2];
    signal tmp_421[3];

    tmp_421[0] <== evals[7][0] + evals[8][0];
    tmp_421[1] <== evals[7][1] + evals[8][1];
    tmp_421[2] <== evals[7][2] + evals[8][2];
    signal tmp_422[3];

    component cmul_14 = CMul();
    cmul_14.ina[0] <== tmp_421[0];
    cmul_14.ina[1] <== tmp_421[1];
    cmul_14.ina[2] <== tmp_421[2];
    cmul_14.inb[0] <== tmp_421[0];
    cmul_14.inb[1] <== tmp_421[1];
    cmul_14.inb[2] <== tmp_421[2];
    tmp_422[0] <== cmul_14.out[0];
    tmp_422[1] <== cmul_14.out[1];
    tmp_422[2] <== cmul_14.out[2];
    signal tmp_423[3];

    component cmul_15 = CMul();
    cmul_15.ina[0] <== tmp_422[0];
    cmul_15.ina[1] <== tmp_422[1];
    cmul_15.ina[2] <== tmp_422[2];
    cmul_15.inb[0] <== tmp_422[0];
    cmul_15.inb[1] <== tmp_422[1];
    cmul_15.inb[2] <== tmp_422[2];
    tmp_423[0] <== cmul_15.out[0];
    tmp_423[1] <== cmul_15.out[1];
    tmp_423[2] <== cmul_15.out[2];
    signal tmp_424[3];

    component cmul_16 = CMul();
    cmul_16.ina[0] <== tmp_422[0];
    cmul_16.ina[1] <== tmp_422[1];
    cmul_16.ina[2] <== tmp_422[2];
    cmul_16.inb[0] <== tmp_423[0];
    cmul_16.inb[1] <== tmp_423[1];
    cmul_16.inb[2] <== tmp_423[2];
    tmp_424[0] <== cmul_16.out[0];
    tmp_424[1] <== cmul_16.out[1];
    tmp_424[2] <== cmul_16.out[2];
    signal tmp_425[3];

    component cmul_17 = CMul();
    cmul_17.ina[0] <== tmp_424[0];
    cmul_17.ina[1] <== tmp_424[1];
    cmul_17.ina[2] <== tmp_424[2];
    cmul_17.inb[0] <== tmp_421[0];
    cmul_17.inb[1] <== tmp_421[1];
    cmul_17.inb[2] <== tmp_421[2];
    tmp_425[0] <== cmul_17.out[0];
    tmp_425[1] <== cmul_17.out[1];
    tmp_425[2] <== cmul_17.out[2];
    signal tmp_4[3];

    tmp_4[0] <== tmp_421[0] - tmp_425[0];
    tmp_4[1] <== tmp_421[1] - tmp_425[1];
    tmp_4[2] <== tmp_421[2] - tmp_425[2];
    signal tmp_5[3];

    component cmul_18 = CMul();
    cmul_18.ina[0] <== evals[4][0];
    cmul_18.ina[1] <== evals[4][1];
    cmul_18.ina[2] <== evals[4][2];
    cmul_18.inb[0] <== tmp_4[0];
    cmul_18.inb[1] <== tmp_4[1];
    cmul_18.inb[2] <== tmp_4[2];
    tmp_5[0] <== cmul_18.out[0];
    tmp_5[1] <== cmul_18.out[1];
    tmp_5[2] <== cmul_18.out[2];
    signal tmp_426[3];

    tmp_426[0] <== tmp_5[0] + tmp_425[0];
    tmp_426[1] <== tmp_5[1] + tmp_425[1];
    tmp_426[2] <== tmp_5[2] + tmp_425[2];
    signal tmp_427[3];

    tmp_427[0] <== evals[9][0] + evals[10][0];
    tmp_427[1] <== evals[9][1] + evals[10][1];
    tmp_427[2] <== evals[9][2] + evals[10][2];
    signal tmp_428[3];

    component cmul_19 = CMul();
    cmul_19.ina[0] <== tmp_427[0];
    cmul_19.ina[1] <== tmp_427[1];
    cmul_19.ina[2] <== tmp_427[2];
    cmul_19.inb[0] <== tmp_427[0];
    cmul_19.inb[1] <== tmp_427[1];
    cmul_19.inb[2] <== tmp_427[2];
    tmp_428[0] <== cmul_19.out[0];
    tmp_428[1] <== cmul_19.out[1];
    tmp_428[2] <== cmul_19.out[2];
    signal tmp_429[3];

    component cmul_20 = CMul();
    cmul_20.ina[0] <== tmp_428[0];
    cmul_20.ina[1] <== tmp_428[1];
    cmul_20.ina[2] <== tmp_428[2];
    cmul_20.inb[0] <== tmp_428[0];
    cmul_20.inb[1] <== tmp_428[1];
    cmul_20.inb[2] <== tmp_428[2];
    tmp_429[0] <== cmul_20.out[0];
    tmp_429[1] <== cmul_20.out[1];
    tmp_429[2] <== cmul_20.out[2];
    signal tmp_430[3];

    component cmul_21 = CMul();
    cmul_21.ina[0] <== tmp_428[0];
    cmul_21.ina[1] <== tmp_428[1];
    cmul_21.ina[2] <== tmp_428[2];
    cmul_21.inb[0] <== tmp_429[0];
    cmul_21.inb[1] <== tmp_429[1];
    cmul_21.inb[2] <== tmp_429[2];
    tmp_430[0] <== cmul_21.out[0];
    tmp_430[1] <== cmul_21.out[1];
    tmp_430[2] <== cmul_21.out[2];
    signal tmp_431[3];

    component cmul_22 = CMul();
    cmul_22.ina[0] <== tmp_430[0];
    cmul_22.ina[1] <== tmp_430[1];
    cmul_22.ina[2] <== tmp_430[2];
    cmul_22.inb[0] <== tmp_427[0];
    cmul_22.inb[1] <== tmp_427[1];
    cmul_22.inb[2] <== tmp_427[2];
    tmp_431[0] <== cmul_22.out[0];
    tmp_431[1] <== cmul_22.out[1];
    tmp_431[2] <== cmul_22.out[2];
    signal tmp_6[3];

    tmp_6[0] <== tmp_427[0] - tmp_431[0];
    tmp_6[1] <== tmp_427[1] - tmp_431[1];
    tmp_6[2] <== tmp_427[2] - tmp_431[2];
    signal tmp_7[3];

    component cmul_23 = CMul();
    cmul_23.ina[0] <== evals[4][0];
    cmul_23.ina[1] <== evals[4][1];
    cmul_23.ina[2] <== evals[4][2];
    cmul_23.inb[0] <== tmp_6[0];
    cmul_23.inb[1] <== tmp_6[1];
    cmul_23.inb[2] <== tmp_6[2];
    tmp_7[0] <== cmul_23.out[0];
    tmp_7[1] <== cmul_23.out[1];
    tmp_7[2] <== cmul_23.out[2];
    signal tmp_432[3];

    tmp_432[0] <== tmp_7[0] + tmp_431[0];
    tmp_432[1] <== tmp_7[1] + tmp_431[1];
    tmp_432[2] <== tmp_7[2] + tmp_431[2];
    signal tmp_433[3];

    tmp_433[0] <== evals[11][0] + evals[12][0];
    tmp_433[1] <== evals[11][1] + evals[12][1];
    tmp_433[2] <== evals[11][2] + evals[12][2];
    signal tmp_434[3];

    component cmul_24 = CMul();
    cmul_24.ina[0] <== tmp_433[0];
    cmul_24.ina[1] <== tmp_433[1];
    cmul_24.ina[2] <== tmp_433[2];
    cmul_24.inb[0] <== tmp_433[0];
    cmul_24.inb[1] <== tmp_433[1];
    cmul_24.inb[2] <== tmp_433[2];
    tmp_434[0] <== cmul_24.out[0];
    tmp_434[1] <== cmul_24.out[1];
    tmp_434[2] <== cmul_24.out[2];
    signal tmp_435[3];

    component cmul_25 = CMul();
    cmul_25.ina[0] <== tmp_434[0];
    cmul_25.ina[1] <== tmp_434[1];
    cmul_25.ina[2] <== tmp_434[2];
    cmul_25.inb[0] <== tmp_434[0];
    cmul_25.inb[1] <== tmp_434[1];
    cmul_25.inb[2] <== tmp_434[2];
    tmp_435[0] <== cmul_25.out[0];
    tmp_435[1] <== cmul_25.out[1];
    tmp_435[2] <== cmul_25.out[2];
    signal tmp_436[3];

    component cmul_26 = CMul();
    cmul_26.ina[0] <== tmp_434[0];
    cmul_26.ina[1] <== tmp_434[1];
    cmul_26.ina[2] <== tmp_434[2];
    cmul_26.inb[0] <== tmp_435[0];
    cmul_26.inb[1] <== tmp_435[1];
    cmul_26.inb[2] <== tmp_435[2];
    tmp_436[0] <== cmul_26.out[0];
    tmp_436[1] <== cmul_26.out[1];
    tmp_436[2] <== cmul_26.out[2];
    signal tmp_437[3];

    component cmul_27 = CMul();
    cmul_27.ina[0] <== tmp_436[0];
    cmul_27.ina[1] <== tmp_436[1];
    cmul_27.ina[2] <== tmp_436[2];
    cmul_27.inb[0] <== tmp_433[0];
    cmul_27.inb[1] <== tmp_433[1];
    cmul_27.inb[2] <== tmp_433[2];
    tmp_437[0] <== cmul_27.out[0];
    tmp_437[1] <== cmul_27.out[1];
    tmp_437[2] <== cmul_27.out[2];
    signal tmp_8[3];

    tmp_8[0] <== tmp_433[0] - tmp_437[0];
    tmp_8[1] <== tmp_433[1] - tmp_437[1];
    tmp_8[2] <== tmp_433[2] - tmp_437[2];
    signal tmp_9[3];

    component cmul_28 = CMul();
    cmul_28.ina[0] <== evals[4][0];
    cmul_28.ina[1] <== evals[4][1];
    cmul_28.ina[2] <== evals[4][2];
    cmul_28.inb[0] <== tmp_8[0];
    cmul_28.inb[1] <== tmp_8[1];
    cmul_28.inb[2] <== tmp_8[2];
    tmp_9[0] <== cmul_28.out[0];
    tmp_9[1] <== cmul_28.out[1];
    tmp_9[2] <== cmul_28.out[2];
    signal tmp_438[3];

    tmp_438[0] <== tmp_9[0] + tmp_437[0];
    tmp_438[1] <== tmp_9[1] + tmp_437[1];
    tmp_438[2] <== tmp_9[2] + tmp_437[2];
    signal tmp_439[3];

    tmp_439[0] <== evals[13][0] + evals[14][0];
    tmp_439[1] <== evals[13][1] + evals[14][1];
    tmp_439[2] <== evals[13][2] + evals[14][2];
    signal tmp_440[3];

    component cmul_29 = CMul();
    cmul_29.ina[0] <== tmp_439[0];
    cmul_29.ina[1] <== tmp_439[1];
    cmul_29.ina[2] <== tmp_439[2];
    cmul_29.inb[0] <== tmp_439[0];
    cmul_29.inb[1] <== tmp_439[1];
    cmul_29.inb[2] <== tmp_439[2];
    tmp_440[0] <== cmul_29.out[0];
    tmp_440[1] <== cmul_29.out[1];
    tmp_440[2] <== cmul_29.out[2];
    signal tmp_441[3];

    component cmul_30 = CMul();
    cmul_30.ina[0] <== tmp_440[0];
    cmul_30.ina[1] <== tmp_440[1];
    cmul_30.ina[2] <== tmp_440[2];
    cmul_30.inb[0] <== tmp_440[0];
    cmul_30.inb[1] <== tmp_440[1];
    cmul_30.inb[2] <== tmp_440[2];
    tmp_441[0] <== cmul_30.out[0];
    tmp_441[1] <== cmul_30.out[1];
    tmp_441[2] <== cmul_30.out[2];
    signal tmp_442[3];

    component cmul_31 = CMul();
    cmul_31.ina[0] <== tmp_440[0];
    cmul_31.ina[1] <== tmp_440[1];
    cmul_31.ina[2] <== tmp_440[2];
    cmul_31.inb[0] <== tmp_441[0];
    cmul_31.inb[1] <== tmp_441[1];
    cmul_31.inb[2] <== tmp_441[2];
    tmp_442[0] <== cmul_31.out[0];
    tmp_442[1] <== cmul_31.out[1];
    tmp_442[2] <== cmul_31.out[2];
    signal tmp_443[3];

    component cmul_32 = CMul();
    cmul_32.ina[0] <== tmp_442[0];
    cmul_32.ina[1] <== tmp_442[1];
    cmul_32.ina[2] <== tmp_442[2];
    cmul_32.inb[0] <== tmp_439[0];
    cmul_32.inb[1] <== tmp_439[1];
    cmul_32.inb[2] <== tmp_439[2];
    tmp_443[0] <== cmul_32.out[0];
    tmp_443[1] <== cmul_32.out[1];
    tmp_443[2] <== cmul_32.out[2];
    signal tmp_10[3];

    tmp_10[0] <== tmp_439[0] - tmp_443[0];
    tmp_10[1] <== tmp_439[1] - tmp_443[1];
    tmp_10[2] <== tmp_439[2] - tmp_443[2];
    signal tmp_11[3];

    component cmul_33 = CMul();
    cmul_33.ina[0] <== evals[4][0];
    cmul_33.ina[1] <== evals[4][1];
    cmul_33.ina[2] <== evals[4][2];
    cmul_33.inb[0] <== tmp_10[0];
    cmul_33.inb[1] <== tmp_10[1];
    cmul_33.inb[2] <== tmp_10[2];
    tmp_11[0] <== cmul_33.out[0];
    tmp_11[1] <== cmul_33.out[1];
    tmp_11[2] <== cmul_33.out[2];
    signal tmp_444[3];

    tmp_444[0] <== tmp_11[0] + tmp_443[0];
    tmp_444[1] <== tmp_11[1] + tmp_443[1];
    tmp_444[2] <== tmp_11[2] + tmp_443[2];
    signal tmp_445[3];

    tmp_445[0] <== evals[15][0] + evals[16][0];
    tmp_445[1] <== evals[15][1] + evals[16][1];
    tmp_445[2] <== evals[15][2] + evals[16][2];
    signal tmp_446[3];

    component cmul_34 = CMul();
    cmul_34.ina[0] <== tmp_445[0];
    cmul_34.ina[1] <== tmp_445[1];
    cmul_34.ina[2] <== tmp_445[2];
    cmul_34.inb[0] <== tmp_445[0];
    cmul_34.inb[1] <== tmp_445[1];
    cmul_34.inb[2] <== tmp_445[2];
    tmp_446[0] <== cmul_34.out[0];
    tmp_446[1] <== cmul_34.out[1];
    tmp_446[2] <== cmul_34.out[2];
    signal tmp_447[3];

    component cmul_35 = CMul();
    cmul_35.ina[0] <== tmp_446[0];
    cmul_35.ina[1] <== tmp_446[1];
    cmul_35.ina[2] <== tmp_446[2];
    cmul_35.inb[0] <== tmp_446[0];
    cmul_35.inb[1] <== tmp_446[1];
    cmul_35.inb[2] <== tmp_446[2];
    tmp_447[0] <== cmul_35.out[0];
    tmp_447[1] <== cmul_35.out[1];
    tmp_447[2] <== cmul_35.out[2];
    signal tmp_448[3];

    component cmul_36 = CMul();
    cmul_36.ina[0] <== tmp_446[0];
    cmul_36.ina[1] <== tmp_446[1];
    cmul_36.ina[2] <== tmp_446[2];
    cmul_36.inb[0] <== tmp_447[0];
    cmul_36.inb[1] <== tmp_447[1];
    cmul_36.inb[2] <== tmp_447[2];
    tmp_448[0] <== cmul_36.out[0];
    tmp_448[1] <== cmul_36.out[1];
    tmp_448[2] <== cmul_36.out[2];
    signal tmp_449[3];

    component cmul_37 = CMul();
    cmul_37.ina[0] <== tmp_448[0];
    cmul_37.ina[1] <== tmp_448[1];
    cmul_37.ina[2] <== tmp_448[2];
    cmul_37.inb[0] <== tmp_445[0];
    cmul_37.inb[1] <== tmp_445[1];
    cmul_37.inb[2] <== tmp_445[2];
    tmp_449[0] <== cmul_37.out[0];
    tmp_449[1] <== cmul_37.out[1];
    tmp_449[2] <== cmul_37.out[2];
    signal tmp_12[3];

    tmp_12[0] <== tmp_445[0] - tmp_449[0];
    tmp_12[1] <== tmp_445[1] - tmp_449[1];
    tmp_12[2] <== tmp_445[2] - tmp_449[2];
    signal tmp_13[3];

    component cmul_38 = CMul();
    cmul_38.ina[0] <== evals[4][0];
    cmul_38.ina[1] <== evals[4][1];
    cmul_38.ina[2] <== evals[4][2];
    cmul_38.inb[0] <== tmp_12[0];
    cmul_38.inb[1] <== tmp_12[1];
    cmul_38.inb[2] <== tmp_12[2];
    tmp_13[0] <== cmul_38.out[0];
    tmp_13[1] <== cmul_38.out[1];
    tmp_13[2] <== cmul_38.out[2];
    signal tmp_450[3];

    tmp_450[0] <== tmp_13[0] + tmp_449[0];
    tmp_450[1] <== tmp_13[1] + tmp_449[1];
    tmp_450[2] <== tmp_13[2] + tmp_449[2];
    signal tmp_451[3];

    tmp_451[0] <== evals[17][0] + evals[18][0];
    tmp_451[1] <== evals[17][1] + evals[18][1];
    tmp_451[2] <== evals[17][2] + evals[18][2];
    signal tmp_452[3];

    component cmul_39 = CMul();
    cmul_39.ina[0] <== tmp_451[0];
    cmul_39.ina[1] <== tmp_451[1];
    cmul_39.ina[2] <== tmp_451[2];
    cmul_39.inb[0] <== tmp_451[0];
    cmul_39.inb[1] <== tmp_451[1];
    cmul_39.inb[2] <== tmp_451[2];
    tmp_452[0] <== cmul_39.out[0];
    tmp_452[1] <== cmul_39.out[1];
    tmp_452[2] <== cmul_39.out[2];
    signal tmp_453[3];

    component cmul_40 = CMul();
    cmul_40.ina[0] <== tmp_452[0];
    cmul_40.ina[1] <== tmp_452[1];
    cmul_40.ina[2] <== tmp_452[2];
    cmul_40.inb[0] <== tmp_452[0];
    cmul_40.inb[1] <== tmp_452[1];
    cmul_40.inb[2] <== tmp_452[2];
    tmp_453[0] <== cmul_40.out[0];
    tmp_453[1] <== cmul_40.out[1];
    tmp_453[2] <== cmul_40.out[2];
    signal tmp_454[3];

    component cmul_41 = CMul();
    cmul_41.ina[0] <== tmp_452[0];
    cmul_41.ina[1] <== tmp_452[1];
    cmul_41.ina[2] <== tmp_452[2];
    cmul_41.inb[0] <== tmp_453[0];
    cmul_41.inb[1] <== tmp_453[1];
    cmul_41.inb[2] <== tmp_453[2];
    tmp_454[0] <== cmul_41.out[0];
    tmp_454[1] <== cmul_41.out[1];
    tmp_454[2] <== cmul_41.out[2];
    signal tmp_455[3];

    component cmul_42 = CMul();
    cmul_42.ina[0] <== tmp_454[0];
    cmul_42.ina[1] <== tmp_454[1];
    cmul_42.ina[2] <== tmp_454[2];
    cmul_42.inb[0] <== tmp_451[0];
    cmul_42.inb[1] <== tmp_451[1];
    cmul_42.inb[2] <== tmp_451[2];
    tmp_455[0] <== cmul_42.out[0];
    tmp_455[1] <== cmul_42.out[1];
    tmp_455[2] <== cmul_42.out[2];
    signal tmp_14[3];

    tmp_14[0] <== tmp_451[0] - tmp_455[0];
    tmp_14[1] <== tmp_451[1] - tmp_455[1];
    tmp_14[2] <== tmp_451[2] - tmp_455[2];
    signal tmp_15[3];

    component cmul_43 = CMul();
    cmul_43.ina[0] <== evals[4][0];
    cmul_43.ina[1] <== evals[4][1];
    cmul_43.ina[2] <== evals[4][2];
    cmul_43.inb[0] <== tmp_14[0];
    cmul_43.inb[1] <== tmp_14[1];
    cmul_43.inb[2] <== tmp_14[2];
    tmp_15[0] <== cmul_43.out[0];
    tmp_15[1] <== cmul_43.out[1];
    tmp_15[2] <== cmul_43.out[2];
    signal tmp_456[3];

    tmp_456[0] <== tmp_15[0] + tmp_455[0];
    tmp_456[1] <== tmp_15[1] + tmp_455[1];
    tmp_456[2] <== tmp_15[2] + tmp_455[2];
    signal tmp_457[3];

    tmp_457[0] <== evals[19][0] + evals[20][0];
    tmp_457[1] <== evals[19][1] + evals[20][1];
    tmp_457[2] <== evals[19][2] + evals[20][2];
    signal tmp_458[3];

    component cmul_44 = CMul();
    cmul_44.ina[0] <== tmp_457[0];
    cmul_44.ina[1] <== tmp_457[1];
    cmul_44.ina[2] <== tmp_457[2];
    cmul_44.inb[0] <== tmp_457[0];
    cmul_44.inb[1] <== tmp_457[1];
    cmul_44.inb[2] <== tmp_457[2];
    tmp_458[0] <== cmul_44.out[0];
    tmp_458[1] <== cmul_44.out[1];
    tmp_458[2] <== cmul_44.out[2];
    signal tmp_459[3];

    component cmul_45 = CMul();
    cmul_45.ina[0] <== tmp_458[0];
    cmul_45.ina[1] <== tmp_458[1];
    cmul_45.ina[2] <== tmp_458[2];
    cmul_45.inb[0] <== tmp_458[0];
    cmul_45.inb[1] <== tmp_458[1];
    cmul_45.inb[2] <== tmp_458[2];
    tmp_459[0] <== cmul_45.out[0];
    tmp_459[1] <== cmul_45.out[1];
    tmp_459[2] <== cmul_45.out[2];
    signal tmp_460[3];

    component cmul_46 = CMul();
    cmul_46.ina[0] <== tmp_458[0];
    cmul_46.ina[1] <== tmp_458[1];
    cmul_46.ina[2] <== tmp_458[2];
    cmul_46.inb[0] <== tmp_459[0];
    cmul_46.inb[1] <== tmp_459[1];
    cmul_46.inb[2] <== tmp_459[2];
    tmp_460[0] <== cmul_46.out[0];
    tmp_460[1] <== cmul_46.out[1];
    tmp_460[2] <== cmul_46.out[2];
    signal tmp_461[3];

    component cmul_47 = CMul();
    cmul_47.ina[0] <== tmp_460[0];
    cmul_47.ina[1] <== tmp_460[1];
    cmul_47.ina[2] <== tmp_460[2];
    cmul_47.inb[0] <== tmp_457[0];
    cmul_47.inb[1] <== tmp_457[1];
    cmul_47.inb[2] <== tmp_457[2];
    tmp_461[0] <== cmul_47.out[0];
    tmp_461[1] <== cmul_47.out[1];
    tmp_461[2] <== cmul_47.out[2];
    signal tmp_16[3];

    tmp_16[0] <== tmp_457[0] - tmp_461[0];
    tmp_16[1] <== tmp_457[1] - tmp_461[1];
    tmp_16[2] <== tmp_457[2] - tmp_461[2];
    signal tmp_17[3];

    component cmul_48 = CMul();
    cmul_48.ina[0] <== evals[4][0];
    cmul_48.ina[1] <== evals[4][1];
    cmul_48.ina[2] <== evals[4][2];
    cmul_48.inb[0] <== tmp_16[0];
    cmul_48.inb[1] <== tmp_16[1];
    cmul_48.inb[2] <== tmp_16[2];
    tmp_17[0] <== cmul_48.out[0];
    tmp_17[1] <== cmul_48.out[1];
    tmp_17[2] <== cmul_48.out[2];
    signal tmp_462[3];

    tmp_462[0] <== tmp_17[0] + tmp_461[0];
    tmp_462[1] <== tmp_17[1] + tmp_461[1];
    tmp_462[2] <== tmp_17[2] + tmp_461[2];
    signal tmp_463[3];

    tmp_463[0] <== evals[21][0] + evals[22][0];
    tmp_463[1] <== evals[21][1] + evals[22][1];
    tmp_463[2] <== evals[21][2] + evals[22][2];
    signal tmp_464[3];

    component cmul_49 = CMul();
    cmul_49.ina[0] <== tmp_463[0];
    cmul_49.ina[1] <== tmp_463[1];
    cmul_49.ina[2] <== tmp_463[2];
    cmul_49.inb[0] <== tmp_463[0];
    cmul_49.inb[1] <== tmp_463[1];
    cmul_49.inb[2] <== tmp_463[2];
    tmp_464[0] <== cmul_49.out[0];
    tmp_464[1] <== cmul_49.out[1];
    tmp_464[2] <== cmul_49.out[2];
    signal tmp_465[3];

    component cmul_50 = CMul();
    cmul_50.ina[0] <== tmp_464[0];
    cmul_50.ina[1] <== tmp_464[1];
    cmul_50.ina[2] <== tmp_464[2];
    cmul_50.inb[0] <== tmp_464[0];
    cmul_50.inb[1] <== tmp_464[1];
    cmul_50.inb[2] <== tmp_464[2];
    tmp_465[0] <== cmul_50.out[0];
    tmp_465[1] <== cmul_50.out[1];
    tmp_465[2] <== cmul_50.out[2];
    signal tmp_466[3];

    component cmul_51 = CMul();
    cmul_51.ina[0] <== tmp_464[0];
    cmul_51.ina[1] <== tmp_464[1];
    cmul_51.ina[2] <== tmp_464[2];
    cmul_51.inb[0] <== tmp_465[0];
    cmul_51.inb[1] <== tmp_465[1];
    cmul_51.inb[2] <== tmp_465[2];
    tmp_466[0] <== cmul_51.out[0];
    tmp_466[1] <== cmul_51.out[1];
    tmp_466[2] <== cmul_51.out[2];
    signal tmp_467[3];

    component cmul_52 = CMul();
    cmul_52.ina[0] <== tmp_466[0];
    cmul_52.ina[1] <== tmp_466[1];
    cmul_52.ina[2] <== tmp_466[2];
    cmul_52.inb[0] <== tmp_463[0];
    cmul_52.inb[1] <== tmp_463[1];
    cmul_52.inb[2] <== tmp_463[2];
    tmp_467[0] <== cmul_52.out[0];
    tmp_467[1] <== cmul_52.out[1];
    tmp_467[2] <== cmul_52.out[2];
    signal tmp_18[3];

    tmp_18[0] <== tmp_463[0] - tmp_467[0];
    tmp_18[1] <== tmp_463[1] - tmp_467[1];
    tmp_18[2] <== tmp_463[2] - tmp_467[2];
    signal tmp_19[3];

    component cmul_53 = CMul();
    cmul_53.ina[0] <== evals[4][0];
    cmul_53.ina[1] <== evals[4][1];
    cmul_53.ina[2] <== evals[4][2];
    cmul_53.inb[0] <== tmp_18[0];
    cmul_53.inb[1] <== tmp_18[1];
    cmul_53.inb[2] <== tmp_18[2];
    tmp_19[0] <== cmul_53.out[0];
    tmp_19[1] <== cmul_53.out[1];
    tmp_19[2] <== cmul_53.out[2];
    signal tmp_468[3];

    tmp_468[0] <== tmp_19[0] + tmp_467[0];
    tmp_468[1] <== tmp_19[1] + tmp_467[1];
    tmp_468[2] <== tmp_19[2] + tmp_467[2];
    signal tmp_469[3];

    tmp_469[0] <== evals[23][0] + evals[24][0];
    tmp_469[1] <== evals[23][1] + evals[24][1];
    tmp_469[2] <== evals[23][2] + evals[24][2];
    signal tmp_470[3];

    component cmul_54 = CMul();
    cmul_54.ina[0] <== tmp_469[0];
    cmul_54.ina[1] <== tmp_469[1];
    cmul_54.ina[2] <== tmp_469[2];
    cmul_54.inb[0] <== tmp_469[0];
    cmul_54.inb[1] <== tmp_469[1];
    cmul_54.inb[2] <== tmp_469[2];
    tmp_470[0] <== cmul_54.out[0];
    tmp_470[1] <== cmul_54.out[1];
    tmp_470[2] <== cmul_54.out[2];
    signal tmp_471[3];

    component cmul_55 = CMul();
    cmul_55.ina[0] <== tmp_470[0];
    cmul_55.ina[1] <== tmp_470[1];
    cmul_55.ina[2] <== tmp_470[2];
    cmul_55.inb[0] <== tmp_470[0];
    cmul_55.inb[1] <== tmp_470[1];
    cmul_55.inb[2] <== tmp_470[2];
    tmp_471[0] <== cmul_55.out[0];
    tmp_471[1] <== cmul_55.out[1];
    tmp_471[2] <== cmul_55.out[2];
    signal tmp_472[3];

    component cmul_56 = CMul();
    cmul_56.ina[0] <== tmp_470[0];
    cmul_56.ina[1] <== tmp_470[1];
    cmul_56.ina[2] <== tmp_470[2];
    cmul_56.inb[0] <== tmp_471[0];
    cmul_56.inb[1] <== tmp_471[1];
    cmul_56.inb[2] <== tmp_471[2];
    tmp_472[0] <== cmul_56.out[0];
    tmp_472[1] <== cmul_56.out[1];
    tmp_472[2] <== cmul_56.out[2];
    signal tmp_473[3];

    component cmul_57 = CMul();
    cmul_57.ina[0] <== tmp_472[0];
    cmul_57.ina[1] <== tmp_472[1];
    cmul_57.ina[2] <== tmp_472[2];
    cmul_57.inb[0] <== tmp_469[0];
    cmul_57.inb[1] <== tmp_469[1];
    cmul_57.inb[2] <== tmp_469[2];
    tmp_473[0] <== cmul_57.out[0];
    tmp_473[1] <== cmul_57.out[1];
    tmp_473[2] <== cmul_57.out[2];
    signal tmp_20[3];

    tmp_20[0] <== tmp_469[0] - tmp_473[0];
    tmp_20[1] <== tmp_469[1] - tmp_473[1];
    tmp_20[2] <== tmp_469[2] - tmp_473[2];
    signal tmp_21[3];

    component cmul_58 = CMul();
    cmul_58.ina[0] <== evals[4][0];
    cmul_58.ina[1] <== evals[4][1];
    cmul_58.ina[2] <== evals[4][2];
    cmul_58.inb[0] <== tmp_20[0];
    cmul_58.inb[1] <== tmp_20[1];
    cmul_58.inb[2] <== tmp_20[2];
    tmp_21[0] <== cmul_58.out[0];
    tmp_21[1] <== cmul_58.out[1];
    tmp_21[2] <== cmul_58.out[2];
    signal tmp_474[3];

    tmp_474[0] <== tmp_21[0] + tmp_473[0];
    tmp_474[1] <== tmp_21[1] + tmp_473[1];
    tmp_474[2] <== tmp_21[2] + tmp_473[2];
    signal tmp_22[3];

    tmp_22[0] <== 25 * tmp_408[0];
    tmp_22[1] <== 25 * tmp_408[1];
    tmp_22[2] <== 25 * tmp_408[2];
    signal tmp_23[3];

    tmp_23[0] <== 15 * tmp_414[0];
    tmp_23[1] <== 15 * tmp_414[1];
    tmp_23[2] <== 15 * tmp_414[2];
    signal tmp_24[3];

    tmp_24[0] <== tmp_22[0] + tmp_23[0];
    tmp_24[1] <== tmp_22[1] + tmp_23[1];
    tmp_24[2] <== tmp_22[2] + tmp_23[2];
    signal tmp_25[3];

    tmp_25[0] <== 41 * tmp_420[0];
    tmp_25[1] <== 41 * tmp_420[1];
    tmp_25[2] <== 41 * tmp_420[2];
    signal tmp_26[3];

    tmp_26[0] <== tmp_24[0] + tmp_25[0];
    tmp_26[1] <== tmp_24[1] + tmp_25[1];
    tmp_26[2] <== tmp_24[2] + tmp_25[2];
    signal tmp_27[3];

    tmp_27[0] <== 16 * tmp_426[0];
    tmp_27[1] <== 16 * tmp_426[1];
    tmp_27[2] <== 16 * tmp_426[2];
    signal tmp_28[3];

    tmp_28[0] <== tmp_26[0] + tmp_27[0];
    tmp_28[1] <== tmp_26[1] + tmp_27[1];
    tmp_28[2] <== tmp_26[2] + tmp_27[2];
    signal tmp_29[3];

    tmp_29[0] <== 2 * tmp_432[0];
    tmp_29[1] <== 2 * tmp_432[1];
    tmp_29[2] <== 2 * tmp_432[2];
    signal tmp_30[3];

    tmp_30[0] <== tmp_28[0] + tmp_29[0];
    tmp_30[1] <== tmp_28[1] + tmp_29[1];
    tmp_30[2] <== tmp_28[2] + tmp_29[2];
    signal tmp_31[3];

    tmp_31[0] <== 28 * tmp_438[0];
    tmp_31[1] <== 28 * tmp_438[1];
    tmp_31[2] <== 28 * tmp_438[2];
    signal tmp_32[3];

    tmp_32[0] <== tmp_30[0] + tmp_31[0];
    tmp_32[1] <== tmp_30[1] + tmp_31[1];
    tmp_32[2] <== tmp_30[2] + tmp_31[2];
    signal tmp_33[3];

    tmp_33[0] <== 13 * tmp_444[0];
    tmp_33[1] <== 13 * tmp_444[1];
    tmp_33[2] <== 13 * tmp_444[2];
    signal tmp_34[3];

    tmp_34[0] <== tmp_32[0] + tmp_33[0];
    tmp_34[1] <== tmp_32[1] + tmp_33[1];
    tmp_34[2] <== tmp_32[2] + tmp_33[2];
    signal tmp_35[3];

    tmp_35[0] <== 13 * tmp_450[0];
    tmp_35[1] <== 13 * tmp_450[1];
    tmp_35[2] <== 13 * tmp_450[2];
    signal tmp_36[3];

    tmp_36[0] <== tmp_34[0] + tmp_35[0];
    tmp_36[1] <== tmp_34[1] + tmp_35[1];
    tmp_36[2] <== tmp_34[2] + tmp_35[2];
    signal tmp_37[3];

    tmp_37[0] <== 39 * tmp_456[0];
    tmp_37[1] <== 39 * tmp_456[1];
    tmp_37[2] <== 39 * tmp_456[2];
    signal tmp_38[3];

    tmp_38[0] <== tmp_36[0] + tmp_37[0];
    tmp_38[1] <== tmp_36[1] + tmp_37[1];
    tmp_38[2] <== tmp_36[2] + tmp_37[2];
    signal tmp_39[3];

    tmp_39[0] <== 18 * tmp_462[0];
    tmp_39[1] <== 18 * tmp_462[1];
    tmp_39[2] <== 18 * tmp_462[2];
    signal tmp_40[3];

    tmp_40[0] <== tmp_38[0] + tmp_39[0];
    tmp_40[1] <== tmp_38[1] + tmp_39[1];
    tmp_40[2] <== tmp_38[2] + tmp_39[2];
    signal tmp_41[3];

    tmp_41[0] <== 34 * tmp_468[0];
    tmp_41[1] <== 34 * tmp_468[1];
    tmp_41[2] <== 34 * tmp_468[2];
    signal tmp_42[3];

    tmp_42[0] <== tmp_40[0] + tmp_41[0];
    tmp_42[1] <== tmp_40[1] + tmp_41[1];
    tmp_42[2] <== tmp_40[2] + tmp_41[2];
    signal tmp_43[3];

    tmp_43[0] <== 20 * tmp_474[0];
    tmp_43[1] <== 20 * tmp_474[1];
    tmp_43[2] <== 20 * tmp_474[2];
    signal tmp_475[3];

    tmp_475[0] <== tmp_42[0] + tmp_43[0];
    tmp_475[1] <== tmp_42[1] + tmp_43[1];
    tmp_475[2] <== tmp_42[2] + tmp_43[2];
    signal tmp_44[3];

    tmp_44[0] <== evals[25][0] - tmp_475[0];
    tmp_44[1] <== evals[25][1] - tmp_475[1];
    tmp_44[2] <== evals[25][2] - tmp_475[2];
    signal tmp_45[3];

    tmp_45[0] <== 1 - evals[26][0];
    tmp_45[1] <== -evals[26][1];
    tmp_45[2] <== -evals[26][2];
    signal tmp_46[3];

    component cmul_59 = CMul();
    cmul_59.ina[0] <== tmp_44[0];
    cmul_59.ina[1] <== tmp_44[1];
    cmul_59.ina[2] <== tmp_44[2];
    cmul_59.inb[0] <== tmp_45[0];
    cmul_59.inb[1] <== tmp_45[1];
    cmul_59.inb[2] <== tmp_45[2];
    tmp_46[0] <== cmul_59.out[0];
    tmp_46[1] <== cmul_59.out[1];
    tmp_46[2] <== cmul_59.out[2];
    signal tmp_476[3];

    tmp_476[0] <== tmp_46[0] - 0;
    tmp_476[1] <== tmp_46[1];
    tmp_476[2] <== tmp_46[2];
    signal tmp_47[3];

    tmp_47[0] <== 20 * tmp_408[0];
    tmp_47[1] <== 20 * tmp_408[1];
    tmp_47[2] <== 20 * tmp_408[2];
    signal tmp_48[3];

    tmp_48[0] <== 17 * tmp_414[0];
    tmp_48[1] <== 17 * tmp_414[1];
    tmp_48[2] <== 17 * tmp_414[2];
    signal tmp_49[3];

    tmp_49[0] <== tmp_47[0] + tmp_48[0];
    tmp_49[1] <== tmp_47[1] + tmp_48[1];
    tmp_49[2] <== tmp_47[2] + tmp_48[2];
    signal tmp_50[3];

    tmp_50[0] <== 15 * tmp_420[0];
    tmp_50[1] <== 15 * tmp_420[1];
    tmp_50[2] <== 15 * tmp_420[2];
    signal tmp_51[3];

    tmp_51[0] <== tmp_49[0] + tmp_50[0];
    tmp_51[1] <== tmp_49[1] + tmp_50[1];
    tmp_51[2] <== tmp_49[2] + tmp_50[2];
    signal tmp_52[3];

    tmp_52[0] <== 41 * tmp_426[0];
    tmp_52[1] <== 41 * tmp_426[1];
    tmp_52[2] <== 41 * tmp_426[2];
    signal tmp_53[3];

    tmp_53[0] <== tmp_51[0] + tmp_52[0];
    tmp_53[1] <== tmp_51[1] + tmp_52[1];
    tmp_53[2] <== tmp_51[2] + tmp_52[2];
    signal tmp_54[3];

    tmp_54[0] <== 16 * tmp_432[0];
    tmp_54[1] <== 16 * tmp_432[1];
    tmp_54[2] <== 16 * tmp_432[2];
    signal tmp_55[3];

    tmp_55[0] <== tmp_53[0] + tmp_54[0];
    tmp_55[1] <== tmp_53[1] + tmp_54[1];
    tmp_55[2] <== tmp_53[2] + tmp_54[2];
    signal tmp_56[3];

    tmp_56[0] <== 2 * tmp_438[0];
    tmp_56[1] <== 2 * tmp_438[1];
    tmp_56[2] <== 2 * tmp_438[2];
    signal tmp_57[3];

    tmp_57[0] <== tmp_55[0] + tmp_56[0];
    tmp_57[1] <== tmp_55[1] + tmp_56[1];
    tmp_57[2] <== tmp_55[2] + tmp_56[2];
    signal tmp_58[3];

    tmp_58[0] <== 28 * tmp_444[0];
    tmp_58[1] <== 28 * tmp_444[1];
    tmp_58[2] <== 28 * tmp_444[2];
    signal tmp_59[3];

    tmp_59[0] <== tmp_57[0] + tmp_58[0];
    tmp_59[1] <== tmp_57[1] + tmp_58[1];
    tmp_59[2] <== tmp_57[2] + tmp_58[2];
    signal tmp_60[3];

    tmp_60[0] <== 13 * tmp_450[0];
    tmp_60[1] <== 13 * tmp_450[1];
    tmp_60[2] <== 13 * tmp_450[2];
    signal tmp_61[3];

    tmp_61[0] <== tmp_59[0] + tmp_60[0];
    tmp_61[1] <== tmp_59[1] + tmp_60[1];
    tmp_61[2] <== tmp_59[2] + tmp_60[2];
    signal tmp_62[3];

    tmp_62[0] <== 13 * tmp_456[0];
    tmp_62[1] <== 13 * tmp_456[1];
    tmp_62[2] <== 13 * tmp_456[2];
    signal tmp_63[3];

    tmp_63[0] <== tmp_61[0] + tmp_62[0];
    tmp_63[1] <== tmp_61[1] + tmp_62[1];
    tmp_63[2] <== tmp_61[2] + tmp_62[2];
    signal tmp_64[3];

    tmp_64[0] <== 39 * tmp_462[0];
    tmp_64[1] <== 39 * tmp_462[1];
    tmp_64[2] <== 39 * tmp_462[2];
    signal tmp_65[3];

    tmp_65[0] <== tmp_63[0] + tmp_64[0];
    tmp_65[1] <== tmp_63[1] + tmp_64[1];
    tmp_65[2] <== tmp_63[2] + tmp_64[2];
    signal tmp_66[3];

    tmp_66[0] <== 18 * tmp_468[0];
    tmp_66[1] <== 18 * tmp_468[1];
    tmp_66[2] <== 18 * tmp_468[2];
    signal tmp_67[3];

    tmp_67[0] <== tmp_65[0] + tmp_66[0];
    tmp_67[1] <== tmp_65[1] + tmp_66[1];
    tmp_67[2] <== tmp_65[2] + tmp_66[2];
    signal tmp_68[3];

    tmp_68[0] <== 34 * tmp_474[0];
    tmp_68[1] <== 34 * tmp_474[1];
    tmp_68[2] <== 34 * tmp_474[2];
    signal tmp_477[3];

    tmp_477[0] <== tmp_67[0] + tmp_68[0];
    tmp_477[1] <== tmp_67[1] + tmp_68[1];
    tmp_477[2] <== tmp_67[2] + tmp_68[2];
    signal tmp_69[3];

    tmp_69[0] <== evals[27][0] - tmp_477[0];
    tmp_69[1] <== evals[27][1] - tmp_477[1];
    tmp_69[2] <== evals[27][2] - tmp_477[2];
    signal tmp_70[3];

    tmp_70[0] <== 1 - evals[26][0];
    tmp_70[1] <== -evals[26][1];
    tmp_70[2] <== -evals[26][2];
    signal tmp_71[3];

    component cmul_60 = CMul();
    cmul_60.ina[0] <== tmp_69[0];
    cmul_60.ina[1] <== tmp_69[1];
    cmul_60.ina[2] <== tmp_69[2];
    cmul_60.inb[0] <== tmp_70[0];
    cmul_60.inb[1] <== tmp_70[1];
    cmul_60.inb[2] <== tmp_70[2];
    tmp_71[0] <== cmul_60.out[0];
    tmp_71[1] <== cmul_60.out[1];
    tmp_71[2] <== cmul_60.out[2];
    signal tmp_478[3];

    tmp_478[0] <== tmp_71[0] - 0;
    tmp_478[1] <== tmp_71[1];
    tmp_478[2] <== tmp_71[2];
    signal tmp_72[3];

    tmp_72[0] <== 34 * tmp_408[0];
    tmp_72[1] <== 34 * tmp_408[1];
    tmp_72[2] <== 34 * tmp_408[2];
    signal tmp_73[3];

    tmp_73[0] <== 20 * tmp_414[0];
    tmp_73[1] <== 20 * tmp_414[1];
    tmp_73[2] <== 20 * tmp_414[2];
    signal tmp_74[3];

    tmp_74[0] <== tmp_72[0] + tmp_73[0];
    tmp_74[1] <== tmp_72[1] + tmp_73[1];
    tmp_74[2] <== tmp_72[2] + tmp_73[2];
    signal tmp_75[3];

    tmp_75[0] <== 17 * tmp_420[0];
    tmp_75[1] <== 17 * tmp_420[1];
    tmp_75[2] <== 17 * tmp_420[2];
    signal tmp_76[3];

    tmp_76[0] <== tmp_74[0] + tmp_75[0];
    tmp_76[1] <== tmp_74[1] + tmp_75[1];
    tmp_76[2] <== tmp_74[2] + tmp_75[2];
    signal tmp_77[3];

    tmp_77[0] <== 15 * tmp_426[0];
    tmp_77[1] <== 15 * tmp_426[1];
    tmp_77[2] <== 15 * tmp_426[2];
    signal tmp_78[3];

    tmp_78[0] <== tmp_76[0] + tmp_77[0];
    tmp_78[1] <== tmp_76[1] + tmp_77[1];
    tmp_78[2] <== tmp_76[2] + tmp_77[2];
    signal tmp_79[3];

    tmp_79[0] <== 41 * tmp_432[0];
    tmp_79[1] <== 41 * tmp_432[1];
    tmp_79[2] <== 41 * tmp_432[2];
    signal tmp_80[3];

    tmp_80[0] <== tmp_78[0] + tmp_79[0];
    tmp_80[1] <== tmp_78[1] + tmp_79[1];
    tmp_80[2] <== tmp_78[2] + tmp_79[2];
    signal tmp_81[3];

    tmp_81[0] <== 16 * tmp_438[0];
    tmp_81[1] <== 16 * tmp_438[1];
    tmp_81[2] <== 16 * tmp_438[2];
    signal tmp_82[3];

    tmp_82[0] <== tmp_80[0] + tmp_81[0];
    tmp_82[1] <== tmp_80[1] + tmp_81[1];
    tmp_82[2] <== tmp_80[2] + tmp_81[2];
    signal tmp_83[3];

    tmp_83[0] <== 2 * tmp_444[0];
    tmp_83[1] <== 2 * tmp_444[1];
    tmp_83[2] <== 2 * tmp_444[2];
    signal tmp_84[3];

    tmp_84[0] <== tmp_82[0] + tmp_83[0];
    tmp_84[1] <== tmp_82[1] + tmp_83[1];
    tmp_84[2] <== tmp_82[2] + tmp_83[2];
    signal tmp_85[3];

    tmp_85[0] <== 28 * tmp_450[0];
    tmp_85[1] <== 28 * tmp_450[1];
    tmp_85[2] <== 28 * tmp_450[2];
    signal tmp_86[3];

    tmp_86[0] <== tmp_84[0] + tmp_85[0];
    tmp_86[1] <== tmp_84[1] + tmp_85[1];
    tmp_86[2] <== tmp_84[2] + tmp_85[2];
    signal tmp_87[3];

    tmp_87[0] <== 13 * tmp_456[0];
    tmp_87[1] <== 13 * tmp_456[1];
    tmp_87[2] <== 13 * tmp_456[2];
    signal tmp_88[3];

    tmp_88[0] <== tmp_86[0] + tmp_87[0];
    tmp_88[1] <== tmp_86[1] + tmp_87[1];
    tmp_88[2] <== tmp_86[2] + tmp_87[2];
    signal tmp_89[3];

    tmp_89[0] <== 13 * tmp_462[0];
    tmp_89[1] <== 13 * tmp_462[1];
    tmp_89[2] <== 13 * tmp_462[2];
    signal tmp_90[3];

    tmp_90[0] <== tmp_88[0] + tmp_89[0];
    tmp_90[1] <== tmp_88[1] + tmp_89[1];
    tmp_90[2] <== tmp_88[2] + tmp_89[2];
    signal tmp_91[3];

    tmp_91[0] <== 39 * tmp_468[0];
    tmp_91[1] <== 39 * tmp_468[1];
    tmp_91[2] <== 39 * tmp_468[2];
    signal tmp_92[3];

    tmp_92[0] <== tmp_90[0] + tmp_91[0];
    tmp_92[1] <== tmp_90[1] + tmp_91[1];
    tmp_92[2] <== tmp_90[2] + tmp_91[2];
    signal tmp_93[3];

    tmp_93[0] <== 18 * tmp_474[0];
    tmp_93[1] <== 18 * tmp_474[1];
    tmp_93[2] <== 18 * tmp_474[2];
    signal tmp_479[3];

    tmp_479[0] <== tmp_92[0] + tmp_93[0];
    tmp_479[1] <== tmp_92[1] + tmp_93[1];
    tmp_479[2] <== tmp_92[2] + tmp_93[2];
    signal tmp_94[3];

    tmp_94[0] <== evals[28][0] - tmp_479[0];
    tmp_94[1] <== evals[28][1] - tmp_479[1];
    tmp_94[2] <== evals[28][2] - tmp_479[2];
    signal tmp_95[3];

    tmp_95[0] <== 1 - evals[26][0];
    tmp_95[1] <== -evals[26][1];
    tmp_95[2] <== -evals[26][2];
    signal tmp_96[3];

    component cmul_61 = CMul();
    cmul_61.ina[0] <== tmp_94[0];
    cmul_61.ina[1] <== tmp_94[1];
    cmul_61.ina[2] <== tmp_94[2];
    cmul_61.inb[0] <== tmp_95[0];
    cmul_61.inb[1] <== tmp_95[1];
    cmul_61.inb[2] <== tmp_95[2];
    tmp_96[0] <== cmul_61.out[0];
    tmp_96[1] <== cmul_61.out[1];
    tmp_96[2] <== cmul_61.out[2];
    signal tmp_480[3];

    tmp_480[0] <== tmp_96[0] - 0;
    tmp_480[1] <== tmp_96[1];
    tmp_480[2] <== tmp_96[2];
    signal tmp_97[3];

    tmp_97[0] <== 18 * tmp_408[0];
    tmp_97[1] <== 18 * tmp_408[1];
    tmp_97[2] <== 18 * tmp_408[2];
    signal tmp_98[3];

    tmp_98[0] <== 34 * tmp_414[0];
    tmp_98[1] <== 34 * tmp_414[1];
    tmp_98[2] <== 34 * tmp_414[2];
    signal tmp_99[3];

    tmp_99[0] <== tmp_97[0] + tmp_98[0];
    tmp_99[1] <== tmp_97[1] + tmp_98[1];
    tmp_99[2] <== tmp_97[2] + tmp_98[2];
    signal tmp_100[3];

    tmp_100[0] <== 20 * tmp_420[0];
    tmp_100[1] <== 20 * tmp_420[1];
    tmp_100[2] <== 20 * tmp_420[2];
    signal tmp_101[3];

    tmp_101[0] <== tmp_99[0] + tmp_100[0];
    tmp_101[1] <== tmp_99[1] + tmp_100[1];
    tmp_101[2] <== tmp_99[2] + tmp_100[2];
    signal tmp_102[3];

    tmp_102[0] <== 17 * tmp_426[0];
    tmp_102[1] <== 17 * tmp_426[1];
    tmp_102[2] <== 17 * tmp_426[2];
    signal tmp_103[3];

    tmp_103[0] <== tmp_101[0] + tmp_102[0];
    tmp_103[1] <== tmp_101[1] + tmp_102[1];
    tmp_103[2] <== tmp_101[2] + tmp_102[2];
    signal tmp_104[3];

    tmp_104[0] <== 15 * tmp_432[0];
    tmp_104[1] <== 15 * tmp_432[1];
    tmp_104[2] <== 15 * tmp_432[2];
    signal tmp_105[3];

    tmp_105[0] <== tmp_103[0] + tmp_104[0];
    tmp_105[1] <== tmp_103[1] + tmp_104[1];
    tmp_105[2] <== tmp_103[2] + tmp_104[2];
    signal tmp_106[3];

    tmp_106[0] <== 41 * tmp_438[0];
    tmp_106[1] <== 41 * tmp_438[1];
    tmp_106[2] <== 41 * tmp_438[2];
    signal tmp_107[3];

    tmp_107[0] <== tmp_105[0] + tmp_106[0];
    tmp_107[1] <== tmp_105[1] + tmp_106[1];
    tmp_107[2] <== tmp_105[2] + tmp_106[2];
    signal tmp_108[3];

    tmp_108[0] <== 16 * tmp_444[0];
    tmp_108[1] <== 16 * tmp_444[1];
    tmp_108[2] <== 16 * tmp_444[2];
    signal tmp_109[3];

    tmp_109[0] <== tmp_107[0] + tmp_108[0];
    tmp_109[1] <== tmp_107[1] + tmp_108[1];
    tmp_109[2] <== tmp_107[2] + tmp_108[2];
    signal tmp_110[3];

    tmp_110[0] <== 2 * tmp_450[0];
    tmp_110[1] <== 2 * tmp_450[1];
    tmp_110[2] <== 2 * tmp_450[2];
    signal tmp_111[3];

    tmp_111[0] <== tmp_109[0] + tmp_110[0];
    tmp_111[1] <== tmp_109[1] + tmp_110[1];
    tmp_111[2] <== tmp_109[2] + tmp_110[2];
    signal tmp_112[3];

    tmp_112[0] <== 28 * tmp_456[0];
    tmp_112[1] <== 28 * tmp_456[1];
    tmp_112[2] <== 28 * tmp_456[2];
    signal tmp_113[3];

    tmp_113[0] <== tmp_111[0] + tmp_112[0];
    tmp_113[1] <== tmp_111[1] + tmp_112[1];
    tmp_113[2] <== tmp_111[2] + tmp_112[2];
    signal tmp_114[3];

    tmp_114[0] <== 13 * tmp_462[0];
    tmp_114[1] <== 13 * tmp_462[1];
    tmp_114[2] <== 13 * tmp_462[2];
    signal tmp_115[3];

    tmp_115[0] <== tmp_113[0] + tmp_114[0];
    tmp_115[1] <== tmp_113[1] + tmp_114[1];
    tmp_115[2] <== tmp_113[2] + tmp_114[2];
    signal tmp_116[3];

    tmp_116[0] <== 13 * tmp_468[0];
    tmp_116[1] <== 13 * tmp_468[1];
    tmp_116[2] <== 13 * tmp_468[2];
    signal tmp_117[3];

    tmp_117[0] <== tmp_115[0] + tmp_116[0];
    tmp_117[1] <== tmp_115[1] + tmp_116[1];
    tmp_117[2] <== tmp_115[2] + tmp_116[2];
    signal tmp_118[3];

    tmp_118[0] <== 39 * tmp_474[0];
    tmp_118[1] <== 39 * tmp_474[1];
    tmp_118[2] <== 39 * tmp_474[2];
    signal tmp_481[3];

    tmp_481[0] <== tmp_117[0] + tmp_118[0];
    tmp_481[1] <== tmp_117[1] + tmp_118[1];
    tmp_481[2] <== tmp_117[2] + tmp_118[2];
    signal tmp_119[3];

    tmp_119[0] <== evals[29][0] - tmp_481[0];
    tmp_119[1] <== evals[29][1] - tmp_481[1];
    tmp_119[2] <== evals[29][2] - tmp_481[2];
    signal tmp_120[3];

    tmp_120[0] <== 1 - evals[26][0];
    tmp_120[1] <== -evals[26][1];
    tmp_120[2] <== -evals[26][2];
    signal tmp_121[3];

    component cmul_62 = CMul();
    cmul_62.ina[0] <== tmp_119[0];
    cmul_62.ina[1] <== tmp_119[1];
    cmul_62.ina[2] <== tmp_119[2];
    cmul_62.inb[0] <== tmp_120[0];
    cmul_62.inb[1] <== tmp_120[1];
    cmul_62.inb[2] <== tmp_120[2];
    tmp_121[0] <== cmul_62.out[0];
    tmp_121[1] <== cmul_62.out[1];
    tmp_121[2] <== cmul_62.out[2];
    signal tmp_482[3];

    tmp_482[0] <== tmp_121[0] - 0;
    tmp_482[1] <== tmp_121[1];
    tmp_482[2] <== tmp_121[2];
    signal tmp_122[3];

    tmp_122[0] <== 39 * tmp_408[0];
    tmp_122[1] <== 39 * tmp_408[1];
    tmp_122[2] <== 39 * tmp_408[2];
    signal tmp_123[3];

    tmp_123[0] <== 18 * tmp_414[0];
    tmp_123[1] <== 18 * tmp_414[1];
    tmp_123[2] <== 18 * tmp_414[2];
    signal tmp_124[3];

    tmp_124[0] <== tmp_122[0] + tmp_123[0];
    tmp_124[1] <== tmp_122[1] + tmp_123[1];
    tmp_124[2] <== tmp_122[2] + tmp_123[2];
    signal tmp_125[3];

    tmp_125[0] <== 34 * tmp_420[0];
    tmp_125[1] <== 34 * tmp_420[1];
    tmp_125[2] <== 34 * tmp_420[2];
    signal tmp_126[3];

    tmp_126[0] <== tmp_124[0] + tmp_125[0];
    tmp_126[1] <== tmp_124[1] + tmp_125[1];
    tmp_126[2] <== tmp_124[2] + tmp_125[2];
    signal tmp_127[3];

    tmp_127[0] <== 20 * tmp_426[0];
    tmp_127[1] <== 20 * tmp_426[1];
    tmp_127[2] <== 20 * tmp_426[2];
    signal tmp_128[3];

    tmp_128[0] <== tmp_126[0] + tmp_127[0];
    tmp_128[1] <== tmp_126[1] + tmp_127[1];
    tmp_128[2] <== tmp_126[2] + tmp_127[2];
    signal tmp_129[3];

    tmp_129[0] <== 17 * tmp_432[0];
    tmp_129[1] <== 17 * tmp_432[1];
    tmp_129[2] <== 17 * tmp_432[2];
    signal tmp_130[3];

    tmp_130[0] <== tmp_128[0] + tmp_129[0];
    tmp_130[1] <== tmp_128[1] + tmp_129[1];
    tmp_130[2] <== tmp_128[2] + tmp_129[2];
    signal tmp_131[3];

    tmp_131[0] <== 15 * tmp_438[0];
    tmp_131[1] <== 15 * tmp_438[1];
    tmp_131[2] <== 15 * tmp_438[2];
    signal tmp_132[3];

    tmp_132[0] <== tmp_130[0] + tmp_131[0];
    tmp_132[1] <== tmp_130[1] + tmp_131[1];
    tmp_132[2] <== tmp_130[2] + tmp_131[2];
    signal tmp_133[3];

    tmp_133[0] <== 41 * tmp_444[0];
    tmp_133[1] <== 41 * tmp_444[1];
    tmp_133[2] <== 41 * tmp_444[2];
    signal tmp_134[3];

    tmp_134[0] <== tmp_132[0] + tmp_133[0];
    tmp_134[1] <== tmp_132[1] + tmp_133[1];
    tmp_134[2] <== tmp_132[2] + tmp_133[2];
    signal tmp_135[3];

    tmp_135[0] <== 16 * tmp_450[0];
    tmp_135[1] <== 16 * tmp_450[1];
    tmp_135[2] <== 16 * tmp_450[2];
    signal tmp_136[3];

    tmp_136[0] <== tmp_134[0] + tmp_135[0];
    tmp_136[1] <== tmp_134[1] + tmp_135[1];
    tmp_136[2] <== tmp_134[2] + tmp_135[2];
    signal tmp_137[3];

    tmp_137[0] <== 2 * tmp_456[0];
    tmp_137[1] <== 2 * tmp_456[1];
    tmp_137[2] <== 2 * tmp_456[2];
    signal tmp_138[3];

    tmp_138[0] <== tmp_136[0] + tmp_137[0];
    tmp_138[1] <== tmp_136[1] + tmp_137[1];
    tmp_138[2] <== tmp_136[2] + tmp_137[2];
    signal tmp_139[3];

    tmp_139[0] <== 28 * tmp_462[0];
    tmp_139[1] <== 28 * tmp_462[1];
    tmp_139[2] <== 28 * tmp_462[2];
    signal tmp_140[3];

    tmp_140[0] <== tmp_138[0] + tmp_139[0];
    tmp_140[1] <== tmp_138[1] + tmp_139[1];
    tmp_140[2] <== tmp_138[2] + tmp_139[2];
    signal tmp_141[3];

    tmp_141[0] <== 13 * tmp_468[0];
    tmp_141[1] <== 13 * tmp_468[1];
    tmp_141[2] <== 13 * tmp_468[2];
    signal tmp_142[3];

    tmp_142[0] <== tmp_140[0] + tmp_141[0];
    tmp_142[1] <== tmp_140[1] + tmp_141[1];
    tmp_142[2] <== tmp_140[2] + tmp_141[2];
    signal tmp_143[3];

    tmp_143[0] <== 13 * tmp_474[0];
    tmp_143[1] <== 13 * tmp_474[1];
    tmp_143[2] <== 13 * tmp_474[2];
    signal tmp_483[3];

    tmp_483[0] <== tmp_142[0] + tmp_143[0];
    tmp_483[1] <== tmp_142[1] + tmp_143[1];
    tmp_483[2] <== tmp_142[2] + tmp_143[2];
    signal tmp_144[3];

    tmp_144[0] <== evals[30][0] - tmp_483[0];
    tmp_144[1] <== evals[30][1] - tmp_483[1];
    tmp_144[2] <== evals[30][2] - tmp_483[2];
    signal tmp_145[3];

    tmp_145[0] <== 1 - evals[26][0];
    tmp_145[1] <== -evals[26][1];
    tmp_145[2] <== -evals[26][2];
    signal tmp_146[3];

    component cmul_63 = CMul();
    cmul_63.ina[0] <== tmp_144[0];
    cmul_63.ina[1] <== tmp_144[1];
    cmul_63.ina[2] <== tmp_144[2];
    cmul_63.inb[0] <== tmp_145[0];
    cmul_63.inb[1] <== tmp_145[1];
    cmul_63.inb[2] <== tmp_145[2];
    tmp_146[0] <== cmul_63.out[0];
    tmp_146[1] <== cmul_63.out[1];
    tmp_146[2] <== cmul_63.out[2];
    signal tmp_484[3];

    tmp_484[0] <== tmp_146[0] - 0;
    tmp_484[1] <== tmp_146[1];
    tmp_484[2] <== tmp_146[2];
    signal tmp_147[3];

    tmp_147[0] <== 13 * tmp_408[0];
    tmp_147[1] <== 13 * tmp_408[1];
    tmp_147[2] <== 13 * tmp_408[2];
    signal tmp_148[3];

    tmp_148[0] <== 39 * tmp_414[0];
    tmp_148[1] <== 39 * tmp_414[1];
    tmp_148[2] <== 39 * tmp_414[2];
    signal tmp_149[3];

    tmp_149[0] <== tmp_147[0] + tmp_148[0];
    tmp_149[1] <== tmp_147[1] + tmp_148[1];
    tmp_149[2] <== tmp_147[2] + tmp_148[2];
    signal tmp_150[3];

    tmp_150[0] <== 18 * tmp_420[0];
    tmp_150[1] <== 18 * tmp_420[1];
    tmp_150[2] <== 18 * tmp_420[2];
    signal tmp_151[3];

    tmp_151[0] <== tmp_149[0] + tmp_150[0];
    tmp_151[1] <== tmp_149[1] + tmp_150[1];
    tmp_151[2] <== tmp_149[2] + tmp_150[2];
    signal tmp_152[3];

    tmp_152[0] <== 34 * tmp_426[0];
    tmp_152[1] <== 34 * tmp_426[1];
    tmp_152[2] <== 34 * tmp_426[2];
    signal tmp_153[3];

    tmp_153[0] <== tmp_151[0] + tmp_152[0];
    tmp_153[1] <== tmp_151[1] + tmp_152[1];
    tmp_153[2] <== tmp_151[2] + tmp_152[2];
    signal tmp_154[3];

    tmp_154[0] <== 20 * tmp_432[0];
    tmp_154[1] <== 20 * tmp_432[1];
    tmp_154[2] <== 20 * tmp_432[2];
    signal tmp_155[3];

    tmp_155[0] <== tmp_153[0] + tmp_154[0];
    tmp_155[1] <== tmp_153[1] + tmp_154[1];
    tmp_155[2] <== tmp_153[2] + tmp_154[2];
    signal tmp_156[3];

    tmp_156[0] <== 17 * tmp_438[0];
    tmp_156[1] <== 17 * tmp_438[1];
    tmp_156[2] <== 17 * tmp_438[2];
    signal tmp_157[3];

    tmp_157[0] <== tmp_155[0] + tmp_156[0];
    tmp_157[1] <== tmp_155[1] + tmp_156[1];
    tmp_157[2] <== tmp_155[2] + tmp_156[2];
    signal tmp_158[3];

    tmp_158[0] <== 15 * tmp_444[0];
    tmp_158[1] <== 15 * tmp_444[1];
    tmp_158[2] <== 15 * tmp_444[2];
    signal tmp_159[3];

    tmp_159[0] <== tmp_157[0] + tmp_158[0];
    tmp_159[1] <== tmp_157[1] + tmp_158[1];
    tmp_159[2] <== tmp_157[2] + tmp_158[2];
    signal tmp_160[3];

    tmp_160[0] <== 41 * tmp_450[0];
    tmp_160[1] <== 41 * tmp_450[1];
    tmp_160[2] <== 41 * tmp_450[2];
    signal tmp_161[3];

    tmp_161[0] <== tmp_159[0] + tmp_160[0];
    tmp_161[1] <== tmp_159[1] + tmp_160[1];
    tmp_161[2] <== tmp_159[2] + tmp_160[2];
    signal tmp_162[3];

    tmp_162[0] <== 16 * tmp_456[0];
    tmp_162[1] <== 16 * tmp_456[1];
    tmp_162[2] <== 16 * tmp_456[2];
    signal tmp_163[3];

    tmp_163[0] <== tmp_161[0] + tmp_162[0];
    tmp_163[1] <== tmp_161[1] + tmp_162[1];
    tmp_163[2] <== tmp_161[2] + tmp_162[2];
    signal tmp_164[3];

    tmp_164[0] <== 2 * tmp_462[0];
    tmp_164[1] <== 2 * tmp_462[1];
    tmp_164[2] <== 2 * tmp_462[2];
    signal tmp_165[3];

    tmp_165[0] <== tmp_163[0] + tmp_164[0];
    tmp_165[1] <== tmp_163[1] + tmp_164[1];
    tmp_165[2] <== tmp_163[2] + tmp_164[2];
    signal tmp_166[3];

    tmp_166[0] <== 28 * tmp_468[0];
    tmp_166[1] <== 28 * tmp_468[1];
    tmp_166[2] <== 28 * tmp_468[2];
    signal tmp_167[3];

    tmp_167[0] <== tmp_165[0] + tmp_166[0];
    tmp_167[1] <== tmp_165[1] + tmp_166[1];
    tmp_167[2] <== tmp_165[2] + tmp_166[2];
    signal tmp_168[3];

    tmp_168[0] <== 13 * tmp_474[0];
    tmp_168[1] <== 13 * tmp_474[1];
    tmp_168[2] <== 13 * tmp_474[2];
    signal tmp_485[3];

    tmp_485[0] <== tmp_167[0] + tmp_168[0];
    tmp_485[1] <== tmp_167[1] + tmp_168[1];
    tmp_485[2] <== tmp_167[2] + tmp_168[2];
    signal tmp_169[3];

    tmp_169[0] <== evals[31][0] - tmp_485[0];
    tmp_169[1] <== evals[31][1] - tmp_485[1];
    tmp_169[2] <== evals[31][2] - tmp_485[2];
    signal tmp_170[3];

    tmp_170[0] <== 1 - evals[26][0];
    tmp_170[1] <== -evals[26][1];
    tmp_170[2] <== -evals[26][2];
    signal tmp_171[3];

    component cmul_64 = CMul();
    cmul_64.ina[0] <== tmp_169[0];
    cmul_64.ina[1] <== tmp_169[1];
    cmul_64.ina[2] <== tmp_169[2];
    cmul_64.inb[0] <== tmp_170[0];
    cmul_64.inb[1] <== tmp_170[1];
    cmul_64.inb[2] <== tmp_170[2];
    tmp_171[0] <== cmul_64.out[0];
    tmp_171[1] <== cmul_64.out[1];
    tmp_171[2] <== cmul_64.out[2];
    signal tmp_486[3];

    tmp_486[0] <== tmp_171[0] - 0;
    tmp_486[1] <== tmp_171[1];
    tmp_486[2] <== tmp_171[2];
    signal tmp_172[3];

    tmp_172[0] <== 13 * tmp_408[0];
    tmp_172[1] <== 13 * tmp_408[1];
    tmp_172[2] <== 13 * tmp_408[2];
    signal tmp_173[3];

    tmp_173[0] <== 13 * tmp_414[0];
    tmp_173[1] <== 13 * tmp_414[1];
    tmp_173[2] <== 13 * tmp_414[2];
    signal tmp_174[3];

    tmp_174[0] <== tmp_172[0] + tmp_173[0];
    tmp_174[1] <== tmp_172[1] + tmp_173[1];
    tmp_174[2] <== tmp_172[2] + tmp_173[2];
    signal tmp_175[3];

    tmp_175[0] <== 39 * tmp_420[0];
    tmp_175[1] <== 39 * tmp_420[1];
    tmp_175[2] <== 39 * tmp_420[2];
    signal tmp_176[3];

    tmp_176[0] <== tmp_174[0] + tmp_175[0];
    tmp_176[1] <== tmp_174[1] + tmp_175[1];
    tmp_176[2] <== tmp_174[2] + tmp_175[2];
    signal tmp_177[3];

    tmp_177[0] <== 18 * tmp_426[0];
    tmp_177[1] <== 18 * tmp_426[1];
    tmp_177[2] <== 18 * tmp_426[2];
    signal tmp_178[3];

    tmp_178[0] <== tmp_176[0] + tmp_177[0];
    tmp_178[1] <== tmp_176[1] + tmp_177[1];
    tmp_178[2] <== tmp_176[2] + tmp_177[2];
    signal tmp_179[3];

    tmp_179[0] <== 34 * tmp_432[0];
    tmp_179[1] <== 34 * tmp_432[1];
    tmp_179[2] <== 34 * tmp_432[2];
    signal tmp_180[3];

    tmp_180[0] <== tmp_178[0] + tmp_179[0];
    tmp_180[1] <== tmp_178[1] + tmp_179[1];
    tmp_180[2] <== tmp_178[2] + tmp_179[2];
    signal tmp_181[3];

    tmp_181[0] <== 20 * tmp_438[0];
    tmp_181[1] <== 20 * tmp_438[1];
    tmp_181[2] <== 20 * tmp_438[2];
    signal tmp_182[3];

    tmp_182[0] <== tmp_180[0] + tmp_181[0];
    tmp_182[1] <== tmp_180[1] + tmp_181[1];
    tmp_182[2] <== tmp_180[2] + tmp_181[2];
    signal tmp_183[3];

    tmp_183[0] <== 17 * tmp_444[0];
    tmp_183[1] <== 17 * tmp_444[1];
    tmp_183[2] <== 17 * tmp_444[2];
    signal tmp_184[3];

    tmp_184[0] <== tmp_182[0] + tmp_183[0];
    tmp_184[1] <== tmp_182[1] + tmp_183[1];
    tmp_184[2] <== tmp_182[2] + tmp_183[2];
    signal tmp_185[3];

    tmp_185[0] <== 15 * tmp_450[0];
    tmp_185[1] <== 15 * tmp_450[1];
    tmp_185[2] <== 15 * tmp_450[2];
    signal tmp_186[3];

    tmp_186[0] <== tmp_184[0] + tmp_185[0];
    tmp_186[1] <== tmp_184[1] + tmp_185[1];
    tmp_186[2] <== tmp_184[2] + tmp_185[2];
    signal tmp_187[3];

    tmp_187[0] <== 41 * tmp_456[0];
    tmp_187[1] <== 41 * tmp_456[1];
    tmp_187[2] <== 41 * tmp_456[2];
    signal tmp_188[3];

    tmp_188[0] <== tmp_186[0] + tmp_187[0];
    tmp_188[1] <== tmp_186[1] + tmp_187[1];
    tmp_188[2] <== tmp_186[2] + tmp_187[2];
    signal tmp_189[3];

    tmp_189[0] <== 16 * tmp_462[0];
    tmp_189[1] <== 16 * tmp_462[1];
    tmp_189[2] <== 16 * tmp_462[2];
    signal tmp_190[3];

    tmp_190[0] <== tmp_188[0] + tmp_189[0];
    tmp_190[1] <== tmp_188[1] + tmp_189[1];
    tmp_190[2] <== tmp_188[2] + tmp_189[2];
    signal tmp_191[3];

    tmp_191[0] <== 2 * tmp_468[0];
    tmp_191[1] <== 2 * tmp_468[1];
    tmp_191[2] <== 2 * tmp_468[2];
    signal tmp_192[3];

    tmp_192[0] <== tmp_190[0] + tmp_191[0];
    tmp_192[1] <== tmp_190[1] + tmp_191[1];
    tmp_192[2] <== tmp_190[2] + tmp_191[2];
    signal tmp_193[3];

    tmp_193[0] <== 28 * tmp_474[0];
    tmp_193[1] <== 28 * tmp_474[1];
    tmp_193[2] <== 28 * tmp_474[2];
    signal tmp_487[3];

    tmp_487[0] <== tmp_192[0] + tmp_193[0];
    tmp_487[1] <== tmp_192[1] + tmp_193[1];
    tmp_487[2] <== tmp_192[2] + tmp_193[2];
    signal tmp_194[3];

    tmp_194[0] <== evals[32][0] - tmp_487[0];
    tmp_194[1] <== evals[32][1] - tmp_487[1];
    tmp_194[2] <== evals[32][2] - tmp_487[2];
    signal tmp_195[3];

    tmp_195[0] <== 1 - evals[26][0];
    tmp_195[1] <== -evals[26][1];
    tmp_195[2] <== -evals[26][2];
    signal tmp_196[3];

    component cmul_65 = CMul();
    cmul_65.ina[0] <== tmp_194[0];
    cmul_65.ina[1] <== tmp_194[1];
    cmul_65.ina[2] <== tmp_194[2];
    cmul_65.inb[0] <== tmp_195[0];
    cmul_65.inb[1] <== tmp_195[1];
    cmul_65.inb[2] <== tmp_195[2];
    tmp_196[0] <== cmul_65.out[0];
    tmp_196[1] <== cmul_65.out[1];
    tmp_196[2] <== cmul_65.out[2];
    signal tmp_488[3];

    tmp_488[0] <== tmp_196[0] - 0;
    tmp_488[1] <== tmp_196[1];
    tmp_488[2] <== tmp_196[2];
    signal tmp_197[3];

    tmp_197[0] <== 28 * tmp_408[0];
    tmp_197[1] <== 28 * tmp_408[1];
    tmp_197[2] <== 28 * tmp_408[2];
    signal tmp_198[3];

    tmp_198[0] <== 13 * tmp_414[0];
    tmp_198[1] <== 13 * tmp_414[1];
    tmp_198[2] <== 13 * tmp_414[2];
    signal tmp_199[3];

    tmp_199[0] <== tmp_197[0] + tmp_198[0];
    tmp_199[1] <== tmp_197[1] + tmp_198[1];
    tmp_199[2] <== tmp_197[2] + tmp_198[2];
    signal tmp_200[3];

    tmp_200[0] <== 13 * tmp_420[0];
    tmp_200[1] <== 13 * tmp_420[1];
    tmp_200[2] <== 13 * tmp_420[2];
    signal tmp_201[3];

    tmp_201[0] <== tmp_199[0] + tmp_200[0];
    tmp_201[1] <== tmp_199[1] + tmp_200[1];
    tmp_201[2] <== tmp_199[2] + tmp_200[2];
    signal tmp_202[3];

    tmp_202[0] <== 39 * tmp_426[0];
    tmp_202[1] <== 39 * tmp_426[1];
    tmp_202[2] <== 39 * tmp_426[2];
    signal tmp_203[3];

    tmp_203[0] <== tmp_201[0] + tmp_202[0];
    tmp_203[1] <== tmp_201[1] + tmp_202[1];
    tmp_203[2] <== tmp_201[2] + tmp_202[2];
    signal tmp_204[3];

    tmp_204[0] <== 18 * tmp_432[0];
    tmp_204[1] <== 18 * tmp_432[1];
    tmp_204[2] <== 18 * tmp_432[2];
    signal tmp_205[3];

    tmp_205[0] <== tmp_203[0] + tmp_204[0];
    tmp_205[1] <== tmp_203[1] + tmp_204[1];
    tmp_205[2] <== tmp_203[2] + tmp_204[2];
    signal tmp_206[3];

    tmp_206[0] <== 34 * tmp_438[0];
    tmp_206[1] <== 34 * tmp_438[1];
    tmp_206[2] <== 34 * tmp_438[2];
    signal tmp_207[3];

    tmp_207[0] <== tmp_205[0] + tmp_206[0];
    tmp_207[1] <== tmp_205[1] + tmp_206[1];
    tmp_207[2] <== tmp_205[2] + tmp_206[2];
    signal tmp_208[3];

    tmp_208[0] <== 20 * tmp_444[0];
    tmp_208[1] <== 20 * tmp_444[1];
    tmp_208[2] <== 20 * tmp_444[2];
    signal tmp_209[3];

    tmp_209[0] <== tmp_207[0] + tmp_208[0];
    tmp_209[1] <== tmp_207[1] + tmp_208[1];
    tmp_209[2] <== tmp_207[2] + tmp_208[2];
    signal tmp_210[3];

    tmp_210[0] <== 17 * tmp_450[0];
    tmp_210[1] <== 17 * tmp_450[1];
    tmp_210[2] <== 17 * tmp_450[2];
    signal tmp_211[3];

    tmp_211[0] <== tmp_209[0] + tmp_210[0];
    tmp_211[1] <== tmp_209[1] + tmp_210[1];
    tmp_211[2] <== tmp_209[2] + tmp_210[2];
    signal tmp_212[3];

    tmp_212[0] <== 15 * tmp_456[0];
    tmp_212[1] <== 15 * tmp_456[1];
    tmp_212[2] <== 15 * tmp_456[2];
    signal tmp_213[3];

    tmp_213[0] <== tmp_211[0] + tmp_212[0];
    tmp_213[1] <== tmp_211[1] + tmp_212[1];
    tmp_213[2] <== tmp_211[2] + tmp_212[2];
    signal tmp_214[3];

    tmp_214[0] <== 41 * tmp_462[0];
    tmp_214[1] <== 41 * tmp_462[1];
    tmp_214[2] <== 41 * tmp_462[2];
    signal tmp_215[3];

    tmp_215[0] <== tmp_213[0] + tmp_214[0];
    tmp_215[1] <== tmp_213[1] + tmp_214[1];
    tmp_215[2] <== tmp_213[2] + tmp_214[2];
    signal tmp_216[3];

    tmp_216[0] <== 16 * tmp_468[0];
    tmp_216[1] <== 16 * tmp_468[1];
    tmp_216[2] <== 16 * tmp_468[2];
    signal tmp_217[3];

    tmp_217[0] <== tmp_215[0] + tmp_216[0];
    tmp_217[1] <== tmp_215[1] + tmp_216[1];
    tmp_217[2] <== tmp_215[2] + tmp_216[2];
    signal tmp_218[3];

    tmp_218[0] <== 2 * tmp_474[0];
    tmp_218[1] <== 2 * tmp_474[1];
    tmp_218[2] <== 2 * tmp_474[2];
    signal tmp_489[3];

    tmp_489[0] <== tmp_217[0] + tmp_218[0];
    tmp_489[1] <== tmp_217[1] + tmp_218[1];
    tmp_489[2] <== tmp_217[2] + tmp_218[2];
    signal tmp_219[3];

    tmp_219[0] <== evals[33][0] - tmp_489[0];
    tmp_219[1] <== evals[33][1] - tmp_489[1];
    tmp_219[2] <== evals[33][2] - tmp_489[2];
    signal tmp_220[3];

    tmp_220[0] <== 1 - evals[26][0];
    tmp_220[1] <== -evals[26][1];
    tmp_220[2] <== -evals[26][2];
    signal tmp_221[3];

    component cmul_66 = CMul();
    cmul_66.ina[0] <== tmp_219[0];
    cmul_66.ina[1] <== tmp_219[1];
    cmul_66.ina[2] <== tmp_219[2];
    cmul_66.inb[0] <== tmp_220[0];
    cmul_66.inb[1] <== tmp_220[1];
    cmul_66.inb[2] <== tmp_220[2];
    tmp_221[0] <== cmul_66.out[0];
    tmp_221[1] <== cmul_66.out[1];
    tmp_221[2] <== cmul_66.out[2];
    signal tmp_490[3];

    tmp_490[0] <== tmp_221[0] - 0;
    tmp_490[1] <== tmp_221[1];
    tmp_490[2] <== tmp_221[2];
    signal tmp_222[3];

    tmp_222[0] <== 2 * tmp_408[0];
    tmp_222[1] <== 2 * tmp_408[1];
    tmp_222[2] <== 2 * tmp_408[2];
    signal tmp_223[3];

    tmp_223[0] <== 28 * tmp_414[0];
    tmp_223[1] <== 28 * tmp_414[1];
    tmp_223[2] <== 28 * tmp_414[2];
    signal tmp_224[3];

    tmp_224[0] <== tmp_222[0] + tmp_223[0];
    tmp_224[1] <== tmp_222[1] + tmp_223[1];
    tmp_224[2] <== tmp_222[2] + tmp_223[2];
    signal tmp_225[3];

    tmp_225[0] <== 13 * tmp_420[0];
    tmp_225[1] <== 13 * tmp_420[1];
    tmp_225[2] <== 13 * tmp_420[2];
    signal tmp_226[3];

    tmp_226[0] <== tmp_224[0] + tmp_225[0];
    tmp_226[1] <== tmp_224[1] + tmp_225[1];
    tmp_226[2] <== tmp_224[2] + tmp_225[2];
    signal tmp_227[3];

    tmp_227[0] <== 13 * tmp_426[0];
    tmp_227[1] <== 13 * tmp_426[1];
    tmp_227[2] <== 13 * tmp_426[2];
    signal tmp_228[3];

    tmp_228[0] <== tmp_226[0] + tmp_227[0];
    tmp_228[1] <== tmp_226[1] + tmp_227[1];
    tmp_228[2] <== tmp_226[2] + tmp_227[2];
    signal tmp_229[3];

    tmp_229[0] <== 39 * tmp_432[0];
    tmp_229[1] <== 39 * tmp_432[1];
    tmp_229[2] <== 39 * tmp_432[2];
    signal tmp_230[3];

    tmp_230[0] <== tmp_228[0] + tmp_229[0];
    tmp_230[1] <== tmp_228[1] + tmp_229[1];
    tmp_230[2] <== tmp_228[2] + tmp_229[2];
    signal tmp_231[3];

    tmp_231[0] <== 18 * tmp_438[0];
    tmp_231[1] <== 18 * tmp_438[1];
    tmp_231[2] <== 18 * tmp_438[2];
    signal tmp_232[3];

    tmp_232[0] <== tmp_230[0] + tmp_231[0];
    tmp_232[1] <== tmp_230[1] + tmp_231[1];
    tmp_232[2] <== tmp_230[2] + tmp_231[2];
    signal tmp_233[3];

    tmp_233[0] <== 34 * tmp_444[0];
    tmp_233[1] <== 34 * tmp_444[1];
    tmp_233[2] <== 34 * tmp_444[2];
    signal tmp_234[3];

    tmp_234[0] <== tmp_232[0] + tmp_233[0];
    tmp_234[1] <== tmp_232[1] + tmp_233[1];
    tmp_234[2] <== tmp_232[2] + tmp_233[2];
    signal tmp_235[3];

    tmp_235[0] <== 20 * tmp_450[0];
    tmp_235[1] <== 20 * tmp_450[1];
    tmp_235[2] <== 20 * tmp_450[2];
    signal tmp_236[3];

    tmp_236[0] <== tmp_234[0] + tmp_235[0];
    tmp_236[1] <== tmp_234[1] + tmp_235[1];
    tmp_236[2] <== tmp_234[2] + tmp_235[2];
    signal tmp_237[3];

    tmp_237[0] <== 17 * tmp_456[0];
    tmp_237[1] <== 17 * tmp_456[1];
    tmp_237[2] <== 17 * tmp_456[2];
    signal tmp_238[3];

    tmp_238[0] <== tmp_236[0] + tmp_237[0];
    tmp_238[1] <== tmp_236[1] + tmp_237[1];
    tmp_238[2] <== tmp_236[2] + tmp_237[2];
    signal tmp_239[3];

    tmp_239[0] <== 15 * tmp_462[0];
    tmp_239[1] <== 15 * tmp_462[1];
    tmp_239[2] <== 15 * tmp_462[2];
    signal tmp_240[3];

    tmp_240[0] <== tmp_238[0] + tmp_239[0];
    tmp_240[1] <== tmp_238[1] + tmp_239[1];
    tmp_240[2] <== tmp_238[2] + tmp_239[2];
    signal tmp_241[3];

    tmp_241[0] <== 41 * tmp_468[0];
    tmp_241[1] <== 41 * tmp_468[1];
    tmp_241[2] <== 41 * tmp_468[2];
    signal tmp_242[3];

    tmp_242[0] <== tmp_240[0] + tmp_241[0];
    tmp_242[1] <== tmp_240[1] + tmp_241[1];
    tmp_242[2] <== tmp_240[2] + tmp_241[2];
    signal tmp_243[3];

    tmp_243[0] <== 16 * tmp_474[0];
    tmp_243[1] <== 16 * tmp_474[1];
    tmp_243[2] <== 16 * tmp_474[2];
    signal tmp_491[3];

    tmp_491[0] <== tmp_242[0] + tmp_243[0];
    tmp_491[1] <== tmp_242[1] + tmp_243[1];
    tmp_491[2] <== tmp_242[2] + tmp_243[2];
    signal tmp_244[3];

    tmp_244[0] <== evals[34][0] - tmp_491[0];
    tmp_244[1] <== evals[34][1] - tmp_491[1];
    tmp_244[2] <== evals[34][2] - tmp_491[2];
    signal tmp_245[3];

    tmp_245[0] <== 1 - evals[26][0];
    tmp_245[1] <== -evals[26][1];
    tmp_245[2] <== -evals[26][2];
    signal tmp_246[3];

    component cmul_67 = CMul();
    cmul_67.ina[0] <== tmp_244[0];
    cmul_67.ina[1] <== tmp_244[1];
    cmul_67.ina[2] <== tmp_244[2];
    cmul_67.inb[0] <== tmp_245[0];
    cmul_67.inb[1] <== tmp_245[1];
    cmul_67.inb[2] <== tmp_245[2];
    tmp_246[0] <== cmul_67.out[0];
    tmp_246[1] <== cmul_67.out[1];
    tmp_246[2] <== cmul_67.out[2];
    signal tmp_492[3];

    tmp_492[0] <== tmp_246[0] - 0;
    tmp_492[1] <== tmp_246[1];
    tmp_492[2] <== tmp_246[2];
    signal tmp_247[3];

    tmp_247[0] <== 16 * tmp_408[0];
    tmp_247[1] <== 16 * tmp_408[1];
    tmp_247[2] <== 16 * tmp_408[2];
    signal tmp_248[3];

    tmp_248[0] <== 2 * tmp_414[0];
    tmp_248[1] <== 2 * tmp_414[1];
    tmp_248[2] <== 2 * tmp_414[2];
    signal tmp_249[3];

    tmp_249[0] <== tmp_247[0] + tmp_248[0];
    tmp_249[1] <== tmp_247[1] + tmp_248[1];
    tmp_249[2] <== tmp_247[2] + tmp_248[2];
    signal tmp_250[3];

    tmp_250[0] <== 28 * tmp_420[0];
    tmp_250[1] <== 28 * tmp_420[1];
    tmp_250[2] <== 28 * tmp_420[2];
    signal tmp_251[3];

    tmp_251[0] <== tmp_249[0] + tmp_250[0];
    tmp_251[1] <== tmp_249[1] + tmp_250[1];
    tmp_251[2] <== tmp_249[2] + tmp_250[2];
    signal tmp_252[3];

    tmp_252[0] <== 13 * tmp_426[0];
    tmp_252[1] <== 13 * tmp_426[1];
    tmp_252[2] <== 13 * tmp_426[2];
    signal tmp_253[3];

    tmp_253[0] <== tmp_251[0] + tmp_252[0];
    tmp_253[1] <== tmp_251[1] + tmp_252[1];
    tmp_253[2] <== tmp_251[2] + tmp_252[2];
    signal tmp_254[3];

    tmp_254[0] <== 13 * tmp_432[0];
    tmp_254[1] <== 13 * tmp_432[1];
    tmp_254[2] <== 13 * tmp_432[2];
    signal tmp_255[3];

    tmp_255[0] <== tmp_253[0] + tmp_254[0];
    tmp_255[1] <== tmp_253[1] + tmp_254[1];
    tmp_255[2] <== tmp_253[2] + tmp_254[2];
    signal tmp_256[3];

    tmp_256[0] <== 39 * tmp_438[0];
    tmp_256[1] <== 39 * tmp_438[1];
    tmp_256[2] <== 39 * tmp_438[2];
    signal tmp_257[3];

    tmp_257[0] <== tmp_255[0] + tmp_256[0];
    tmp_257[1] <== tmp_255[1] + tmp_256[1];
    tmp_257[2] <== tmp_255[2] + tmp_256[2];
    signal tmp_258[3];

    tmp_258[0] <== 18 * tmp_444[0];
    tmp_258[1] <== 18 * tmp_444[1];
    tmp_258[2] <== 18 * tmp_444[2];
    signal tmp_259[3];

    tmp_259[0] <== tmp_257[0] + tmp_258[0];
    tmp_259[1] <== tmp_257[1] + tmp_258[1];
    tmp_259[2] <== tmp_257[2] + tmp_258[2];
    signal tmp_260[3];

    tmp_260[0] <== 34 * tmp_450[0];
    tmp_260[1] <== 34 * tmp_450[1];
    tmp_260[2] <== 34 * tmp_450[2];
    signal tmp_261[3];

    tmp_261[0] <== tmp_259[0] + tmp_260[0];
    tmp_261[1] <== tmp_259[1] + tmp_260[1];
    tmp_261[2] <== tmp_259[2] + tmp_260[2];
    signal tmp_262[3];

    tmp_262[0] <== 20 * tmp_456[0];
    tmp_262[1] <== 20 * tmp_456[1];
    tmp_262[2] <== 20 * tmp_456[2];
    signal tmp_263[3];

    tmp_263[0] <== tmp_261[0] + tmp_262[0];
    tmp_263[1] <== tmp_261[1] + tmp_262[1];
    tmp_263[2] <== tmp_261[2] + tmp_262[2];
    signal tmp_264[3];

    tmp_264[0] <== 17 * tmp_462[0];
    tmp_264[1] <== 17 * tmp_462[1];
    tmp_264[2] <== 17 * tmp_462[2];
    signal tmp_265[3];

    tmp_265[0] <== tmp_263[0] + tmp_264[0];
    tmp_265[1] <== tmp_263[1] + tmp_264[1];
    tmp_265[2] <== tmp_263[2] + tmp_264[2];
    signal tmp_266[3];

    tmp_266[0] <== 15 * tmp_468[0];
    tmp_266[1] <== 15 * tmp_468[1];
    tmp_266[2] <== 15 * tmp_468[2];
    signal tmp_267[3];

    tmp_267[0] <== tmp_265[0] + tmp_266[0];
    tmp_267[1] <== tmp_265[1] + tmp_266[1];
    tmp_267[2] <== tmp_265[2] + tmp_266[2];
    signal tmp_268[3];

    tmp_268[0] <== 41 * tmp_474[0];
    tmp_268[1] <== 41 * tmp_474[1];
    tmp_268[2] <== 41 * tmp_474[2];
    signal tmp_493[3];

    tmp_493[0] <== tmp_267[0] + tmp_268[0];
    tmp_493[1] <== tmp_267[1] + tmp_268[1];
    tmp_493[2] <== tmp_267[2] + tmp_268[2];
    signal tmp_269[3];

    tmp_269[0] <== evals[35][0] - tmp_493[0];
    tmp_269[1] <== evals[35][1] - tmp_493[1];
    tmp_269[2] <== evals[35][2] - tmp_493[2];
    signal tmp_270[3];

    tmp_270[0] <== 1 - evals[26][0];
    tmp_270[1] <== -evals[26][1];
    tmp_270[2] <== -evals[26][2];
    signal tmp_271[3];

    component cmul_68 = CMul();
    cmul_68.ina[0] <== tmp_269[0];
    cmul_68.ina[1] <== tmp_269[1];
    cmul_68.ina[2] <== tmp_269[2];
    cmul_68.inb[0] <== tmp_270[0];
    cmul_68.inb[1] <== tmp_270[1];
    cmul_68.inb[2] <== tmp_270[2];
    tmp_271[0] <== cmul_68.out[0];
    tmp_271[1] <== cmul_68.out[1];
    tmp_271[2] <== cmul_68.out[2];
    signal tmp_494[3];

    tmp_494[0] <== tmp_271[0] - 0;
    tmp_494[1] <== tmp_271[1];
    tmp_494[2] <== tmp_271[2];
    signal tmp_272[3];

    tmp_272[0] <== 41 * tmp_408[0];
    tmp_272[1] <== 41 * tmp_408[1];
    tmp_272[2] <== 41 * tmp_408[2];
    signal tmp_273[3];

    tmp_273[0] <== 16 * tmp_414[0];
    tmp_273[1] <== 16 * tmp_414[1];
    tmp_273[2] <== 16 * tmp_414[2];
    signal tmp_274[3];

    tmp_274[0] <== tmp_272[0] + tmp_273[0];
    tmp_274[1] <== tmp_272[1] + tmp_273[1];
    tmp_274[2] <== tmp_272[2] + tmp_273[2];
    signal tmp_275[3];

    tmp_275[0] <== 2 * tmp_420[0];
    tmp_275[1] <== 2 * tmp_420[1];
    tmp_275[2] <== 2 * tmp_420[2];
    signal tmp_276[3];

    tmp_276[0] <== tmp_274[0] + tmp_275[0];
    tmp_276[1] <== tmp_274[1] + tmp_275[1];
    tmp_276[2] <== tmp_274[2] + tmp_275[2];
    signal tmp_277[3];

    tmp_277[0] <== 28 * tmp_426[0];
    tmp_277[1] <== 28 * tmp_426[1];
    tmp_277[2] <== 28 * tmp_426[2];
    signal tmp_278[3];

    tmp_278[0] <== tmp_276[0] + tmp_277[0];
    tmp_278[1] <== tmp_276[1] + tmp_277[1];
    tmp_278[2] <== tmp_276[2] + tmp_277[2];
    signal tmp_279[3];

    tmp_279[0] <== 13 * tmp_432[0];
    tmp_279[1] <== 13 * tmp_432[1];
    tmp_279[2] <== 13 * tmp_432[2];
    signal tmp_280[3];

    tmp_280[0] <== tmp_278[0] + tmp_279[0];
    tmp_280[1] <== tmp_278[1] + tmp_279[1];
    tmp_280[2] <== tmp_278[2] + tmp_279[2];
    signal tmp_281[3];

    tmp_281[0] <== 13 * tmp_438[0];
    tmp_281[1] <== 13 * tmp_438[1];
    tmp_281[2] <== 13 * tmp_438[2];
    signal tmp_282[3];

    tmp_282[0] <== tmp_280[0] + tmp_281[0];
    tmp_282[1] <== tmp_280[1] + tmp_281[1];
    tmp_282[2] <== tmp_280[2] + tmp_281[2];
    signal tmp_283[3];

    tmp_283[0] <== 39 * tmp_444[0];
    tmp_283[1] <== 39 * tmp_444[1];
    tmp_283[2] <== 39 * tmp_444[2];
    signal tmp_284[3];

    tmp_284[0] <== tmp_282[0] + tmp_283[0];
    tmp_284[1] <== tmp_282[1] + tmp_283[1];
    tmp_284[2] <== tmp_282[2] + tmp_283[2];
    signal tmp_285[3];

    tmp_285[0] <== 18 * tmp_450[0];
    tmp_285[1] <== 18 * tmp_450[1];
    tmp_285[2] <== 18 * tmp_450[2];
    signal tmp_286[3];

    tmp_286[0] <== tmp_284[0] + tmp_285[0];
    tmp_286[1] <== tmp_284[1] + tmp_285[1];
    tmp_286[2] <== tmp_284[2] + tmp_285[2];
    signal tmp_287[3];

    tmp_287[0] <== 34 * tmp_456[0];
    tmp_287[1] <== 34 * tmp_456[1];
    tmp_287[2] <== 34 * tmp_456[2];
    signal tmp_288[3];

    tmp_288[0] <== tmp_286[0] + tmp_287[0];
    tmp_288[1] <== tmp_286[1] + tmp_287[1];
    tmp_288[2] <== tmp_286[2] + tmp_287[2];
    signal tmp_289[3];

    tmp_289[0] <== 20 * tmp_462[0];
    tmp_289[1] <== 20 * tmp_462[1];
    tmp_289[2] <== 20 * tmp_462[2];
    signal tmp_290[3];

    tmp_290[0] <== tmp_288[0] + tmp_289[0];
    tmp_290[1] <== tmp_288[1] + tmp_289[1];
    tmp_290[2] <== tmp_288[2] + tmp_289[2];
    signal tmp_291[3];

    tmp_291[0] <== 17 * tmp_468[0];
    tmp_291[1] <== 17 * tmp_468[1];
    tmp_291[2] <== 17 * tmp_468[2];
    signal tmp_292[3];

    tmp_292[0] <== tmp_290[0] + tmp_291[0];
    tmp_292[1] <== tmp_290[1] + tmp_291[1];
    tmp_292[2] <== tmp_290[2] + tmp_291[2];
    signal tmp_293[3];

    tmp_293[0] <== 15 * tmp_474[0];
    tmp_293[1] <== 15 * tmp_474[1];
    tmp_293[2] <== 15 * tmp_474[2];
    signal tmp_495[3];

    tmp_495[0] <== tmp_292[0] + tmp_293[0];
    tmp_495[1] <== tmp_292[1] + tmp_293[1];
    tmp_495[2] <== tmp_292[2] + tmp_293[2];
    signal tmp_294[3];

    tmp_294[0] <== evals[36][0] - tmp_495[0];
    tmp_294[1] <== evals[36][1] - tmp_495[1];
    tmp_294[2] <== evals[36][2] - tmp_495[2];
    signal tmp_295[3];

    tmp_295[0] <== 1 - evals[26][0];
    tmp_295[1] <== -evals[26][1];
    tmp_295[2] <== -evals[26][2];
    signal tmp_296[3];

    component cmul_69 = CMul();
    cmul_69.ina[0] <== tmp_294[0];
    cmul_69.ina[1] <== tmp_294[1];
    cmul_69.ina[2] <== tmp_294[2];
    cmul_69.inb[0] <== tmp_295[0];
    cmul_69.inb[1] <== tmp_295[1];
    cmul_69.inb[2] <== tmp_295[2];
    tmp_296[0] <== cmul_69.out[0];
    tmp_296[1] <== cmul_69.out[1];
    tmp_296[2] <== cmul_69.out[2];
    signal tmp_496[3];

    tmp_496[0] <== tmp_296[0] - 0;
    tmp_496[1] <== tmp_296[1];
    tmp_496[2] <== tmp_296[2];
    signal tmp_297[3];

    tmp_297[0] <== 15 * tmp_408[0];
    tmp_297[1] <== 15 * tmp_408[1];
    tmp_297[2] <== 15 * tmp_408[2];
    signal tmp_298[3];

    tmp_298[0] <== 41 * tmp_414[0];
    tmp_298[1] <== 41 * tmp_414[1];
    tmp_298[2] <== 41 * tmp_414[2];
    signal tmp_299[3];

    tmp_299[0] <== tmp_297[0] + tmp_298[0];
    tmp_299[1] <== tmp_297[1] + tmp_298[1];
    tmp_299[2] <== tmp_297[2] + tmp_298[2];
    signal tmp_300[3];

    tmp_300[0] <== 16 * tmp_420[0];
    tmp_300[1] <== 16 * tmp_420[1];
    tmp_300[2] <== 16 * tmp_420[2];
    signal tmp_301[3];

    tmp_301[0] <== tmp_299[0] + tmp_300[0];
    tmp_301[1] <== tmp_299[1] + tmp_300[1];
    tmp_301[2] <== tmp_299[2] + tmp_300[2];
    signal tmp_302[3];

    tmp_302[0] <== 2 * tmp_426[0];
    tmp_302[1] <== 2 * tmp_426[1];
    tmp_302[2] <== 2 * tmp_426[2];
    signal tmp_303[3];

    tmp_303[0] <== tmp_301[0] + tmp_302[0];
    tmp_303[1] <== tmp_301[1] + tmp_302[1];
    tmp_303[2] <== tmp_301[2] + tmp_302[2];
    signal tmp_304[3];

    tmp_304[0] <== 28 * tmp_432[0];
    tmp_304[1] <== 28 * tmp_432[1];
    tmp_304[2] <== 28 * tmp_432[2];
    signal tmp_305[3];

    tmp_305[0] <== tmp_303[0] + tmp_304[0];
    tmp_305[1] <== tmp_303[1] + tmp_304[1];
    tmp_305[2] <== tmp_303[2] + tmp_304[2];
    signal tmp_306[3];

    tmp_306[0] <== 13 * tmp_438[0];
    tmp_306[1] <== 13 * tmp_438[1];
    tmp_306[2] <== 13 * tmp_438[2];
    signal tmp_307[3];

    tmp_307[0] <== tmp_305[0] + tmp_306[0];
    tmp_307[1] <== tmp_305[1] + tmp_306[1];
    tmp_307[2] <== tmp_305[2] + tmp_306[2];
    signal tmp_308[3];

    tmp_308[0] <== 13 * tmp_444[0];
    tmp_308[1] <== 13 * tmp_444[1];
    tmp_308[2] <== 13 * tmp_444[2];
    signal tmp_309[3];

    tmp_309[0] <== tmp_307[0] + tmp_308[0];
    tmp_309[1] <== tmp_307[1] + tmp_308[1];
    tmp_309[2] <== tmp_307[2] + tmp_308[2];
    signal tmp_310[3];

    tmp_310[0] <== 39 * tmp_450[0];
    tmp_310[1] <== 39 * tmp_450[1];
    tmp_310[2] <== 39 * tmp_450[2];
    signal tmp_311[3];

    tmp_311[0] <== tmp_309[0] + tmp_310[0];
    tmp_311[1] <== tmp_309[1] + tmp_310[1];
    tmp_311[2] <== tmp_309[2] + tmp_310[2];
    signal tmp_312[3];

    tmp_312[0] <== 18 * tmp_456[0];
    tmp_312[1] <== 18 * tmp_456[1];
    tmp_312[2] <== 18 * tmp_456[2];
    signal tmp_313[3];

    tmp_313[0] <== tmp_311[0] + tmp_312[0];
    tmp_313[1] <== tmp_311[1] + tmp_312[1];
    tmp_313[2] <== tmp_311[2] + tmp_312[2];
    signal tmp_314[3];

    tmp_314[0] <== 34 * tmp_462[0];
    tmp_314[1] <== 34 * tmp_462[1];
    tmp_314[2] <== 34 * tmp_462[2];
    signal tmp_315[3];

    tmp_315[0] <== tmp_313[0] + tmp_314[0];
    tmp_315[1] <== tmp_313[1] + tmp_314[1];
    tmp_315[2] <== tmp_313[2] + tmp_314[2];
    signal tmp_316[3];

    tmp_316[0] <== 20 * tmp_468[0];
    tmp_316[1] <== 20 * tmp_468[1];
    tmp_316[2] <== 20 * tmp_468[2];
    signal tmp_317[3];

    tmp_317[0] <== tmp_315[0] + tmp_316[0];
    tmp_317[1] <== tmp_315[1] + tmp_316[1];
    tmp_317[2] <== tmp_315[2] + tmp_316[2];
    signal tmp_318[3];

    tmp_318[0] <== 17 * tmp_474[0];
    tmp_318[1] <== 17 * tmp_474[1];
    tmp_318[2] <== 17 * tmp_474[2];
    signal tmp_497[3];

    tmp_497[0] <== tmp_317[0] + tmp_318[0];
    tmp_497[1] <== tmp_317[1] + tmp_318[1];
    tmp_497[2] <== tmp_317[2] + tmp_318[2];
    signal tmp_319[3];

    tmp_319[0] <== evals[37][0] - tmp_497[0];
    tmp_319[1] <== evals[37][1] - tmp_497[1];
    tmp_319[2] <== evals[37][2] - tmp_497[2];
    signal tmp_320[3];

    tmp_320[0] <== 1 - evals[26][0];
    tmp_320[1] <== -evals[26][1];
    tmp_320[2] <== -evals[26][2];
    signal tmp_321[3];

    component cmul_70 = CMul();
    cmul_70.ina[0] <== tmp_319[0];
    cmul_70.ina[1] <== tmp_319[1];
    cmul_70.ina[2] <== tmp_319[2];
    cmul_70.inb[0] <== tmp_320[0];
    cmul_70.inb[1] <== tmp_320[1];
    cmul_70.inb[2] <== tmp_320[2];
    tmp_321[0] <== cmul_70.out[0];
    tmp_321[1] <== cmul_70.out[1];
    tmp_321[2] <== cmul_70.out[2];
    signal tmp_498[3];

    tmp_498[0] <== tmp_321[0] - 0;
    tmp_498[1] <== tmp_321[1];
    tmp_498[2] <== tmp_321[2];
    signal tmp_322[3];

    tmp_322[0] <== evals[38][0] - evals[0][0];
    tmp_322[1] <== evals[38][1] - evals[0][1];
    tmp_322[2] <== evals[38][2] - evals[0][2];
    signal tmp_323[3];

    component cmul_71 = CMul();
    cmul_71.ina[0] <== tmp_322[0];
    cmul_71.ina[1] <== tmp_322[1];
    cmul_71.ina[2] <== tmp_322[2];
    cmul_71.inb[0] <== evals[39][0];
    cmul_71.inb[1] <== evals[39][1];
    cmul_71.inb[2] <== evals[39][2];
    tmp_323[0] <== cmul_71.out[0];
    tmp_323[1] <== cmul_71.out[1];
    tmp_323[2] <== cmul_71.out[2];
    signal tmp_499[3];

    tmp_499[0] <== tmp_323[0] - 0;
    tmp_499[1] <== tmp_323[1];
    tmp_499[2] <== tmp_323[2];
    signal tmp_324[3];

    tmp_324[0] <== evals[40][0] - evals[2][0];
    tmp_324[1] <== evals[40][1] - evals[2][1];
    tmp_324[2] <== evals[40][2] - evals[2][2];
    signal tmp_325[3];

    component cmul_72 = CMul();
    cmul_72.ina[0] <== tmp_324[0];
    cmul_72.ina[1] <== tmp_324[1];
    cmul_72.ina[2] <== tmp_324[2];
    cmul_72.inb[0] <== evals[39][0];
    cmul_72.inb[1] <== evals[39][1];
    cmul_72.inb[2] <== evals[39][2];
    tmp_325[0] <== cmul_72.out[0];
    tmp_325[1] <== cmul_72.out[1];
    tmp_325[2] <== cmul_72.out[2];
    signal tmp_500[3];

    tmp_500[0] <== tmp_325[0] - 0;
    tmp_500[1] <== tmp_325[1];
    tmp_500[2] <== tmp_325[2];
    signal tmp_326[3];

    tmp_326[0] <== evals[41][0] - evals[5][0];
    tmp_326[1] <== evals[41][1] - evals[5][1];
    tmp_326[2] <== evals[41][2] - evals[5][2];
    signal tmp_327[3];

    component cmul_73 = CMul();
    cmul_73.ina[0] <== tmp_326[0];
    cmul_73.ina[1] <== tmp_326[1];
    cmul_73.ina[2] <== tmp_326[2];
    cmul_73.inb[0] <== evals[39][0];
    cmul_73.inb[1] <== evals[39][1];
    cmul_73.inb[2] <== evals[39][2];
    tmp_327[0] <== cmul_73.out[0];
    tmp_327[1] <== cmul_73.out[1];
    tmp_327[2] <== cmul_73.out[2];
    signal tmp_501[3];

    tmp_501[0] <== tmp_327[0] - 0;
    tmp_501[1] <== tmp_327[1];
    tmp_501[2] <== tmp_327[2];
    signal tmp_328[3];

    tmp_328[0] <== evals[42][0] - evals[7][0];
    tmp_328[1] <== evals[42][1] - evals[7][1];
    tmp_328[2] <== evals[42][2] - evals[7][2];
    signal tmp_329[3];

    component cmul_74 = CMul();
    cmul_74.ina[0] <== tmp_328[0];
    cmul_74.ina[1] <== tmp_328[1];
    cmul_74.ina[2] <== tmp_328[2];
    cmul_74.inb[0] <== evals[39][0];
    cmul_74.inb[1] <== evals[39][1];
    cmul_74.inb[2] <== evals[39][2];
    tmp_329[0] <== cmul_74.out[0];
    tmp_329[1] <== cmul_74.out[1];
    tmp_329[2] <== cmul_74.out[2];
    signal tmp_502[3];

    tmp_502[0] <== tmp_329[0] - 0;
    tmp_502[1] <== tmp_329[1];
    tmp_502[2] <== tmp_329[2];
    signal tmp_330[3];

    tmp_330[0] <== evals[38][0] - evals[43][0];
    tmp_330[1] <== evals[38][1] - evals[43][1];
    tmp_330[2] <== evals[38][2] - evals[43][2];
    signal tmp_331[3];

    tmp_331[0] <== 1 - evals[26][0];
    tmp_331[1] <== -evals[26][1];
    tmp_331[2] <== -evals[26][2];
    signal tmp_332[3];

    component cmul_75 = CMul();
    cmul_75.ina[0] <== tmp_330[0];
    cmul_75.ina[1] <== tmp_330[1];
    cmul_75.ina[2] <== tmp_330[2];
    cmul_75.inb[0] <== tmp_331[0];
    cmul_75.inb[1] <== tmp_331[1];
    cmul_75.inb[2] <== tmp_331[2];
    tmp_332[0] <== cmul_75.out[0];
    tmp_332[1] <== cmul_75.out[1];
    tmp_332[2] <== cmul_75.out[2];
    signal tmp_503[3];

    tmp_503[0] <== tmp_332[0] - 0;
    tmp_503[1] <== tmp_332[1];
    tmp_503[2] <== tmp_332[2];
    signal tmp_333[3];

    tmp_333[0] <== evals[40][0] - evals[44][0];
    tmp_333[1] <== evals[40][1] - evals[44][1];
    tmp_333[2] <== evals[40][2] - evals[44][2];
    signal tmp_334[3];

    tmp_334[0] <== 1 - evals[26][0];
    tmp_334[1] <== -evals[26][1];
    tmp_334[2] <== -evals[26][2];
    signal tmp_335[3];

    component cmul_76 = CMul();
    cmul_76.ina[0] <== tmp_333[0];
    cmul_76.ina[1] <== tmp_333[1];
    cmul_76.ina[2] <== tmp_333[2];
    cmul_76.inb[0] <== tmp_334[0];
    cmul_76.inb[1] <== tmp_334[1];
    cmul_76.inb[2] <== tmp_334[2];
    tmp_335[0] <== cmul_76.out[0];
    tmp_335[1] <== cmul_76.out[1];
    tmp_335[2] <== cmul_76.out[2];
    signal tmp_504[3];

    tmp_504[0] <== tmp_335[0] - 0;
    tmp_504[1] <== tmp_335[1];
    tmp_504[2] <== tmp_335[2];
    signal tmp_336[3];

    tmp_336[0] <== evals[41][0] - evals[45][0];
    tmp_336[1] <== evals[41][1] - evals[45][1];
    tmp_336[2] <== evals[41][2] - evals[45][2];
    signal tmp_337[3];

    tmp_337[0] <== 1 - evals[26][0];
    tmp_337[1] <== -evals[26][1];
    tmp_337[2] <== -evals[26][2];
    signal tmp_338[3];

    component cmul_77 = CMul();
    cmul_77.ina[0] <== tmp_336[0];
    cmul_77.ina[1] <== tmp_336[1];
    cmul_77.ina[2] <== tmp_336[2];
    cmul_77.inb[0] <== tmp_337[0];
    cmul_77.inb[1] <== tmp_337[1];
    cmul_77.inb[2] <== tmp_337[2];
    tmp_338[0] <== cmul_77.out[0];
    tmp_338[1] <== cmul_77.out[1];
    tmp_338[2] <== cmul_77.out[2];
    signal tmp_505[3];

    tmp_505[0] <== tmp_338[0] - 0;
    tmp_505[1] <== tmp_338[1];
    tmp_505[2] <== tmp_338[2];
    signal tmp_339[3];

    tmp_339[0] <== evals[42][0] - evals[46][0];
    tmp_339[1] <== evals[42][1] - evals[46][1];
    tmp_339[2] <== evals[42][2] - evals[46][2];
    signal tmp_340[3];

    tmp_340[0] <== 1 - evals[26][0];
    tmp_340[1] <== -evals[26][1];
    tmp_340[2] <== -evals[26][2];
    signal tmp_341[3];

    component cmul_78 = CMul();
    cmul_78.ina[0] <== tmp_339[0];
    cmul_78.ina[1] <== tmp_339[1];
    cmul_78.ina[2] <== tmp_339[2];
    cmul_78.inb[0] <== tmp_340[0];
    cmul_78.inb[1] <== tmp_340[1];
    cmul_78.inb[2] <== tmp_340[2];
    tmp_341[0] <== cmul_78.out[0];
    tmp_341[1] <== cmul_78.out[1];
    tmp_341[2] <== cmul_78.out[2];
    signal tmp_506[3];

    tmp_506[0] <== tmp_341[0] - 0;
    tmp_506[1] <== tmp_341[1];
    tmp_506[2] <== tmp_341[2];
    signal tmp_342[3];

    tmp_342[0] <== 1 - evals[47][0];
    tmp_342[1] <== -evals[47][1];
    tmp_342[2] <== -evals[47][2];
    signal tmp_343[3];

    component cmul_79 = CMul();
    cmul_79.ina[0] <== evals[47][0];
    cmul_79.ina[1] <== evals[47][1];
    cmul_79.ina[2] <== evals[47][2];
    cmul_79.inb[0] <== tmp_342[0];
    cmul_79.inb[1] <== tmp_342[1];
    cmul_79.inb[2] <== tmp_342[2];
    tmp_343[0] <== cmul_79.out[0];
    tmp_343[1] <== cmul_79.out[1];
    tmp_343[2] <== cmul_79.out[2];
    signal tmp_507[3];

    tmp_507[0] <== tmp_343[0] - 0;
    tmp_507[1] <== tmp_343[1];
    tmp_507[2] <== tmp_343[2];
    signal tmp_344[3];

    tmp_344[0] <== 1 - evals[48][0];
    tmp_344[1] <== -evals[48][1];
    tmp_344[2] <== -evals[48][2];
    signal tmp_345[3];

    component cmul_80 = CMul();
    cmul_80.ina[0] <== evals[48][0];
    cmul_80.ina[1] <== evals[48][1];
    cmul_80.ina[2] <== evals[48][2];
    cmul_80.inb[0] <== tmp_344[0];
    cmul_80.inb[1] <== tmp_344[1];
    cmul_80.inb[2] <== tmp_344[2];
    tmp_345[0] <== cmul_80.out[0];
    tmp_345[1] <== cmul_80.out[1];
    tmp_345[2] <== cmul_80.out[2];
    signal tmp_508[3];

    tmp_508[0] <== tmp_345[0] - 0;
    tmp_508[1] <== tmp_345[1];
    tmp_508[2] <== tmp_345[2];
    signal tmp_346[3];

    tmp_346[0] <== 1 - evals[49][0];
    tmp_346[1] <== -evals[49][1];
    tmp_346[2] <== -evals[49][2];
    signal tmp_347[3];

    component cmul_81 = CMul();
    cmul_81.ina[0] <== evals[49][0];
    cmul_81.ina[1] <== evals[49][1];
    cmul_81.ina[2] <== evals[49][2];
    cmul_81.inb[0] <== tmp_346[0];
    cmul_81.inb[1] <== tmp_346[1];
    cmul_81.inb[2] <== tmp_346[2];
    tmp_347[0] <== cmul_81.out[0];
    tmp_347[1] <== cmul_81.out[1];
    tmp_347[2] <== cmul_81.out[2];
    signal tmp_509[3];

    tmp_509[0] <== tmp_347[0] - 0;
    tmp_509[1] <== tmp_347[1];
    tmp_509[2] <== tmp_347[2];
    signal tmp_348[3];

    tmp_348[0] <== 1 - evals[50][0];
    tmp_348[1] <== -evals[50][1];
    tmp_348[2] <== -evals[50][2];
    signal tmp_349[3];

    component cmul_82 = CMul();
    cmul_82.ina[0] <== evals[47][0];
    cmul_82.ina[1] <== evals[47][1];
    cmul_82.ina[2] <== evals[47][2];
    cmul_82.inb[0] <== tmp_348[0];
    cmul_82.inb[1] <== tmp_348[1];
    cmul_82.inb[2] <== tmp_348[2];
    tmp_349[0] <== cmul_82.out[0];
    tmp_349[1] <== cmul_82.out[1];
    tmp_349[2] <== cmul_82.out[2];
    signal tmp_510[3];

    tmp_510[0] <== tmp_349[0] - 0;
    tmp_510[1] <== tmp_349[1];
    tmp_510[2] <== tmp_349[2];
    signal tmp_350[3];

    tmp_350[0] <== 1 - evals[50][0];
    tmp_350[1] <== -evals[50][1];
    tmp_350[2] <== -evals[50][2];
    signal tmp_351[3];

    component cmul_83 = CMul();
    cmul_83.ina[0] <== evals[48][0];
    cmul_83.ina[1] <== evals[48][1];
    cmul_83.ina[2] <== evals[48][2];
    cmul_83.inb[0] <== tmp_350[0];
    cmul_83.inb[1] <== tmp_350[1];
    cmul_83.inb[2] <== tmp_350[2];
    tmp_351[0] <== cmul_83.out[0];
    tmp_351[1] <== cmul_83.out[1];
    tmp_351[2] <== cmul_83.out[2];
    signal tmp_511[3];

    tmp_511[0] <== tmp_351[0] - 0;
    tmp_511[1] <== tmp_351[1];
    tmp_511[2] <== tmp_351[2];
    signal tmp_352[3];

    tmp_352[0] <== 1 - evals[50][0];
    tmp_352[1] <== -evals[50][1];
    tmp_352[2] <== -evals[50][2];
    signal tmp_353[3];

    component cmul_84 = CMul();
    cmul_84.ina[0] <== evals[49][0];
    cmul_84.ina[1] <== evals[49][1];
    cmul_84.ina[2] <== evals[49][2];
    cmul_84.inb[0] <== tmp_352[0];
    cmul_84.inb[1] <== tmp_352[1];
    cmul_84.inb[2] <== tmp_352[2];
    tmp_353[0] <== cmul_84.out[0];
    tmp_353[1] <== cmul_84.out[1];
    tmp_353[2] <== cmul_84.out[2];
    signal tmp_512[3];

    tmp_512[0] <== tmp_353[0] - 0;
    tmp_512[1] <== tmp_353[1];
    tmp_512[2] <== tmp_353[2];
    signal tmp_354[3];

    component cmul_85 = CMul();
    cmul_85.ina[0] <== challenges[4][0];
    cmul_85.ina[1] <== challenges[4][1];
    cmul_85.ina[2] <== challenges[4][2];
    cmul_85.inb[0] <== tmp_476[0];
    cmul_85.inb[1] <== tmp_476[1];
    cmul_85.inb[2] <== tmp_476[2];
    tmp_354[0] <== cmul_85.out[0];
    tmp_354[1] <== cmul_85.out[1];
    tmp_354[2] <== cmul_85.out[2];
    signal tmp_355[3];

    tmp_355[0] <== tmp_354[0] + tmp_478[0];
    tmp_355[1] <== tmp_354[1] + tmp_478[1];
    tmp_355[2] <== tmp_354[2] + tmp_478[2];
    signal tmp_356[3];

    component cmul_86 = CMul();
    cmul_86.ina[0] <== challenges[4][0];
    cmul_86.ina[1] <== challenges[4][1];
    cmul_86.ina[2] <== challenges[4][2];
    cmul_86.inb[0] <== tmp_355[0];
    cmul_86.inb[1] <== tmp_355[1];
    cmul_86.inb[2] <== tmp_355[2];
    tmp_356[0] <== cmul_86.out[0];
    tmp_356[1] <== cmul_86.out[1];
    tmp_356[2] <== cmul_86.out[2];
    signal tmp_357[3];

    tmp_357[0] <== tmp_356[0] + tmp_480[0];
    tmp_357[1] <== tmp_356[1] + tmp_480[1];
    tmp_357[2] <== tmp_356[2] + tmp_480[2];
    signal tmp_358[3];

    component cmul_87 = CMul();
    cmul_87.ina[0] <== challenges[4][0];
    cmul_87.ina[1] <== challenges[4][1];
    cmul_87.ina[2] <== challenges[4][2];
    cmul_87.inb[0] <== tmp_357[0];
    cmul_87.inb[1] <== tmp_357[1];
    cmul_87.inb[2] <== tmp_357[2];
    tmp_358[0] <== cmul_87.out[0];
    tmp_358[1] <== cmul_87.out[1];
    tmp_358[2] <== cmul_87.out[2];
    signal tmp_359[3];

    tmp_359[0] <== tmp_358[0] + tmp_482[0];
    tmp_359[1] <== tmp_358[1] + tmp_482[1];
    tmp_359[2] <== tmp_358[2] + tmp_482[2];
    signal tmp_360[3];

    component cmul_88 = CMul();
    cmul_88.ina[0] <== challenges[4][0];
    cmul_88.ina[1] <== challenges[4][1];
    cmul_88.ina[2] <== challenges[4][2];
    cmul_88.inb[0] <== tmp_359[0];
    cmul_88.inb[1] <== tmp_359[1];
    cmul_88.inb[2] <== tmp_359[2];
    tmp_360[0] <== cmul_88.out[0];
    tmp_360[1] <== cmul_88.out[1];
    tmp_360[2] <== cmul_88.out[2];
    signal tmp_361[3];

    tmp_361[0] <== tmp_360[0] + tmp_484[0];
    tmp_361[1] <== tmp_360[1] + tmp_484[1];
    tmp_361[2] <== tmp_360[2] + tmp_484[2];
    signal tmp_362[3];

    component cmul_89 = CMul();
    cmul_89.ina[0] <== challenges[4][0];
    cmul_89.ina[1] <== challenges[4][1];
    cmul_89.ina[2] <== challenges[4][2];
    cmul_89.inb[0] <== tmp_361[0];
    cmul_89.inb[1] <== tmp_361[1];
    cmul_89.inb[2] <== tmp_361[2];
    tmp_362[0] <== cmul_89.out[0];
    tmp_362[1] <== cmul_89.out[1];
    tmp_362[2] <== cmul_89.out[2];
    signal tmp_363[3];

    tmp_363[0] <== tmp_362[0] + tmp_486[0];
    tmp_363[1] <== tmp_362[1] + tmp_486[1];
    tmp_363[2] <== tmp_362[2] + tmp_486[2];
    signal tmp_364[3];

    component cmul_90 = CMul();
    cmul_90.ina[0] <== challenges[4][0];
    cmul_90.ina[1] <== challenges[4][1];
    cmul_90.ina[2] <== challenges[4][2];
    cmul_90.inb[0] <== tmp_363[0];
    cmul_90.inb[1] <== tmp_363[1];
    cmul_90.inb[2] <== tmp_363[2];
    tmp_364[0] <== cmul_90.out[0];
    tmp_364[1] <== cmul_90.out[1];
    tmp_364[2] <== cmul_90.out[2];
    signal tmp_365[3];

    tmp_365[0] <== tmp_364[0] + tmp_488[0];
    tmp_365[1] <== tmp_364[1] + tmp_488[1];
    tmp_365[2] <== tmp_364[2] + tmp_488[2];
    signal tmp_366[3];

    component cmul_91 = CMul();
    cmul_91.ina[0] <== challenges[4][0];
    cmul_91.ina[1] <== challenges[4][1];
    cmul_91.ina[2] <== challenges[4][2];
    cmul_91.inb[0] <== tmp_365[0];
    cmul_91.inb[1] <== tmp_365[1];
    cmul_91.inb[2] <== tmp_365[2];
    tmp_366[0] <== cmul_91.out[0];
    tmp_366[1] <== cmul_91.out[1];
    tmp_366[2] <== cmul_91.out[2];
    signal tmp_367[3];

    tmp_367[0] <== tmp_366[0] + tmp_490[0];
    tmp_367[1] <== tmp_366[1] + tmp_490[1];
    tmp_367[2] <== tmp_366[2] + tmp_490[2];
    signal tmp_368[3];

    component cmul_92 = CMul();
    cmul_92.ina[0] <== challenges[4][0];
    cmul_92.ina[1] <== challenges[4][1];
    cmul_92.ina[2] <== challenges[4][2];
    cmul_92.inb[0] <== tmp_367[0];
    cmul_92.inb[1] <== tmp_367[1];
    cmul_92.inb[2] <== tmp_367[2];
    tmp_368[0] <== cmul_92.out[0];
    tmp_368[1] <== cmul_92.out[1];
    tmp_368[2] <== cmul_92.out[2];
    signal tmp_369[3];

    tmp_369[0] <== tmp_368[0] + tmp_492[0];
    tmp_369[1] <== tmp_368[1] + tmp_492[1];
    tmp_369[2] <== tmp_368[2] + tmp_492[2];
    signal tmp_370[3];

    component cmul_93 = CMul();
    cmul_93.ina[0] <== challenges[4][0];
    cmul_93.ina[1] <== challenges[4][1];
    cmul_93.ina[2] <== challenges[4][2];
    cmul_93.inb[0] <== tmp_369[0];
    cmul_93.inb[1] <== tmp_369[1];
    cmul_93.inb[2] <== tmp_369[2];
    tmp_370[0] <== cmul_93.out[0];
    tmp_370[1] <== cmul_93.out[1];
    tmp_370[2] <== cmul_93.out[2];
    signal tmp_371[3];

    tmp_371[0] <== tmp_370[0] + tmp_494[0];
    tmp_371[1] <== tmp_370[1] + tmp_494[1];
    tmp_371[2] <== tmp_370[2] + tmp_494[2];
    signal tmp_372[3];

    component cmul_94 = CMul();
    cmul_94.ina[0] <== challenges[4][0];
    cmul_94.ina[1] <== challenges[4][1];
    cmul_94.ina[2] <== challenges[4][2];
    cmul_94.inb[0] <== tmp_371[0];
    cmul_94.inb[1] <== tmp_371[1];
    cmul_94.inb[2] <== tmp_371[2];
    tmp_372[0] <== cmul_94.out[0];
    tmp_372[1] <== cmul_94.out[1];
    tmp_372[2] <== cmul_94.out[2];
    signal tmp_373[3];

    tmp_373[0] <== tmp_372[0] + tmp_496[0];
    tmp_373[1] <== tmp_372[1] + tmp_496[1];
    tmp_373[2] <== tmp_372[2] + tmp_496[2];
    signal tmp_374[3];

    component cmul_95 = CMul();
    cmul_95.ina[0] <== challenges[4][0];
    cmul_95.ina[1] <== challenges[4][1];
    cmul_95.ina[2] <== challenges[4][2];
    cmul_95.inb[0] <== tmp_373[0];
    cmul_95.inb[1] <== tmp_373[1];
    cmul_95.inb[2] <== tmp_373[2];
    tmp_374[0] <== cmul_95.out[0];
    tmp_374[1] <== cmul_95.out[1];
    tmp_374[2] <== cmul_95.out[2];
    signal tmp_375[3];

    tmp_375[0] <== tmp_374[0] + tmp_498[0];
    tmp_375[1] <== tmp_374[1] + tmp_498[1];
    tmp_375[2] <== tmp_374[2] + tmp_498[2];
    signal tmp_376[3];

    component cmul_96 = CMul();
    cmul_96.ina[0] <== challenges[4][0];
    cmul_96.ina[1] <== challenges[4][1];
    cmul_96.ina[2] <== challenges[4][2];
    cmul_96.inb[0] <== tmp_375[0];
    cmul_96.inb[1] <== tmp_375[1];
    cmul_96.inb[2] <== tmp_375[2];
    tmp_376[0] <== cmul_96.out[0];
    tmp_376[1] <== cmul_96.out[1];
    tmp_376[2] <== cmul_96.out[2];
    signal tmp_377[3];

    tmp_377[0] <== tmp_376[0] + tmp_499[0];
    tmp_377[1] <== tmp_376[1] + tmp_499[1];
    tmp_377[2] <== tmp_376[2] + tmp_499[2];
    signal tmp_378[3];

    component cmul_97 = CMul();
    cmul_97.ina[0] <== challenges[4][0];
    cmul_97.ina[1] <== challenges[4][1];
    cmul_97.ina[2] <== challenges[4][2];
    cmul_97.inb[0] <== tmp_377[0];
    cmul_97.inb[1] <== tmp_377[1];
    cmul_97.inb[2] <== tmp_377[2];
    tmp_378[0] <== cmul_97.out[0];
    tmp_378[1] <== cmul_97.out[1];
    tmp_378[2] <== cmul_97.out[2];
    signal tmp_379[3];

    tmp_379[0] <== tmp_378[0] + tmp_500[0];
    tmp_379[1] <== tmp_378[1] + tmp_500[1];
    tmp_379[2] <== tmp_378[2] + tmp_500[2];
    signal tmp_380[3];

    component cmul_98 = CMul();
    cmul_98.ina[0] <== challenges[4][0];
    cmul_98.ina[1] <== challenges[4][1];
    cmul_98.ina[2] <== challenges[4][2];
    cmul_98.inb[0] <== tmp_379[0];
    cmul_98.inb[1] <== tmp_379[1];
    cmul_98.inb[2] <== tmp_379[2];
    tmp_380[0] <== cmul_98.out[0];
    tmp_380[1] <== cmul_98.out[1];
    tmp_380[2] <== cmul_98.out[2];
    signal tmp_381[3];

    tmp_381[0] <== tmp_380[0] + tmp_501[0];
    tmp_381[1] <== tmp_380[1] + tmp_501[1];
    tmp_381[2] <== tmp_380[2] + tmp_501[2];
    signal tmp_382[3];

    component cmul_99 = CMul();
    cmul_99.ina[0] <== challenges[4][0];
    cmul_99.ina[1] <== challenges[4][1];
    cmul_99.ina[2] <== challenges[4][2];
    cmul_99.inb[0] <== tmp_381[0];
    cmul_99.inb[1] <== tmp_381[1];
    cmul_99.inb[2] <== tmp_381[2];
    tmp_382[0] <== cmul_99.out[0];
    tmp_382[1] <== cmul_99.out[1];
    tmp_382[2] <== cmul_99.out[2];
    signal tmp_383[3];

    tmp_383[0] <== tmp_382[0] + tmp_502[0];
    tmp_383[1] <== tmp_382[1] + tmp_502[1];
    tmp_383[2] <== tmp_382[2] + tmp_502[2];
    signal tmp_384[3];

    component cmul_100 = CMul();
    cmul_100.ina[0] <== challenges[4][0];
    cmul_100.ina[1] <== challenges[4][1];
    cmul_100.ina[2] <== challenges[4][2];
    cmul_100.inb[0] <== tmp_383[0];
    cmul_100.inb[1] <== tmp_383[1];
    cmul_100.inb[2] <== tmp_383[2];
    tmp_384[0] <== cmul_100.out[0];
    tmp_384[1] <== cmul_100.out[1];
    tmp_384[2] <== cmul_100.out[2];
    signal tmp_385[3];

    tmp_385[0] <== tmp_384[0] + tmp_503[0];
    tmp_385[1] <== tmp_384[1] + tmp_503[1];
    tmp_385[2] <== tmp_384[2] + tmp_503[2];
    signal tmp_386[3];

    component cmul_101 = CMul();
    cmul_101.ina[0] <== challenges[4][0];
    cmul_101.ina[1] <== challenges[4][1];
    cmul_101.ina[2] <== challenges[4][2];
    cmul_101.inb[0] <== tmp_385[0];
    cmul_101.inb[1] <== tmp_385[1];
    cmul_101.inb[2] <== tmp_385[2];
    tmp_386[0] <== cmul_101.out[0];
    tmp_386[1] <== cmul_101.out[1];
    tmp_386[2] <== cmul_101.out[2];
    signal tmp_387[3];

    tmp_387[0] <== tmp_386[0] + tmp_504[0];
    tmp_387[1] <== tmp_386[1] + tmp_504[1];
    tmp_387[2] <== tmp_386[2] + tmp_504[2];
    signal tmp_388[3];

    component cmul_102 = CMul();
    cmul_102.ina[0] <== challenges[4][0];
    cmul_102.ina[1] <== challenges[4][1];
    cmul_102.ina[2] <== challenges[4][2];
    cmul_102.inb[0] <== tmp_387[0];
    cmul_102.inb[1] <== tmp_387[1];
    cmul_102.inb[2] <== tmp_387[2];
    tmp_388[0] <== cmul_102.out[0];
    tmp_388[1] <== cmul_102.out[1];
    tmp_388[2] <== cmul_102.out[2];
    signal tmp_389[3];

    tmp_389[0] <== tmp_388[0] + tmp_505[0];
    tmp_389[1] <== tmp_388[1] + tmp_505[1];
    tmp_389[2] <== tmp_388[2] + tmp_505[2];
    signal tmp_390[3];

    component cmul_103 = CMul();
    cmul_103.ina[0] <== challenges[4][0];
    cmul_103.ina[1] <== challenges[4][1];
    cmul_103.ina[2] <== challenges[4][2];
    cmul_103.inb[0] <== tmp_389[0];
    cmul_103.inb[1] <== tmp_389[1];
    cmul_103.inb[2] <== tmp_389[2];
    tmp_390[0] <== cmul_103.out[0];
    tmp_390[1] <== cmul_103.out[1];
    tmp_390[2] <== cmul_103.out[2];
    signal tmp_391[3];

    tmp_391[0] <== tmp_390[0] + tmp_506[0];
    tmp_391[1] <== tmp_390[1] + tmp_506[1];
    tmp_391[2] <== tmp_390[2] + tmp_506[2];
    signal tmp_392[3];

    component cmul_104 = CMul();
    cmul_104.ina[0] <== challenges[4][0];
    cmul_104.ina[1] <== challenges[4][1];
    cmul_104.ina[2] <== challenges[4][2];
    cmul_104.inb[0] <== tmp_391[0];
    cmul_104.inb[1] <== tmp_391[1];
    cmul_104.inb[2] <== tmp_391[2];
    tmp_392[0] <== cmul_104.out[0];
    tmp_392[1] <== cmul_104.out[1];
    tmp_392[2] <== cmul_104.out[2];
    signal tmp_393[3];

    tmp_393[0] <== tmp_392[0] + tmp_507[0];
    tmp_393[1] <== tmp_392[1] + tmp_507[1];
    tmp_393[2] <== tmp_392[2] + tmp_507[2];
    signal tmp_394[3];

    component cmul_105 = CMul();
    cmul_105.ina[0] <== challenges[4][0];
    cmul_105.ina[1] <== challenges[4][1];
    cmul_105.ina[2] <== challenges[4][2];
    cmul_105.inb[0] <== tmp_393[0];
    cmul_105.inb[1] <== tmp_393[1];
    cmul_105.inb[2] <== tmp_393[2];
    tmp_394[0] <== cmul_105.out[0];
    tmp_394[1] <== cmul_105.out[1];
    tmp_394[2] <== cmul_105.out[2];
    signal tmp_395[3];

    tmp_395[0] <== tmp_394[0] + tmp_508[0];
    tmp_395[1] <== tmp_394[1] + tmp_508[1];
    tmp_395[2] <== tmp_394[2] + tmp_508[2];
    signal tmp_396[3];

    component cmul_106 = CMul();
    cmul_106.ina[0] <== challenges[4][0];
    cmul_106.ina[1] <== challenges[4][1];
    cmul_106.ina[2] <== challenges[4][2];
    cmul_106.inb[0] <== tmp_395[0];
    cmul_106.inb[1] <== tmp_395[1];
    cmul_106.inb[2] <== tmp_395[2];
    tmp_396[0] <== cmul_106.out[0];
    tmp_396[1] <== cmul_106.out[1];
    tmp_396[2] <== cmul_106.out[2];
    signal tmp_397[3];

    tmp_397[0] <== tmp_396[0] + tmp_509[0];
    tmp_397[1] <== tmp_396[1] + tmp_509[1];
    tmp_397[2] <== tmp_396[2] + tmp_509[2];
    signal tmp_398[3];

    component cmul_107 = CMul();
    cmul_107.ina[0] <== challenges[4][0];
    cmul_107.ina[1] <== challenges[4][1];
    cmul_107.ina[2] <== challenges[4][2];
    cmul_107.inb[0] <== tmp_397[0];
    cmul_107.inb[1] <== tmp_397[1];
    cmul_107.inb[2] <== tmp_397[2];
    tmp_398[0] <== cmul_107.out[0];
    tmp_398[1] <== cmul_107.out[1];
    tmp_398[2] <== cmul_107.out[2];
    signal tmp_399[3];

    tmp_399[0] <== tmp_398[0] + tmp_510[0];
    tmp_399[1] <== tmp_398[1] + tmp_510[1];
    tmp_399[2] <== tmp_398[2] + tmp_510[2];
    signal tmp_400[3];

    component cmul_108 = CMul();
    cmul_108.ina[0] <== challenges[4][0];
    cmul_108.ina[1] <== challenges[4][1];
    cmul_108.ina[2] <== challenges[4][2];
    cmul_108.inb[0] <== tmp_399[0];
    cmul_108.inb[1] <== tmp_399[1];
    cmul_108.inb[2] <== tmp_399[2];
    tmp_400[0] <== cmul_108.out[0];
    tmp_400[1] <== cmul_108.out[1];
    tmp_400[2] <== cmul_108.out[2];
    signal tmp_401[3];

    tmp_401[0] <== tmp_400[0] + tmp_511[0];
    tmp_401[1] <== tmp_400[1] + tmp_511[1];
    tmp_401[2] <== tmp_400[2] + tmp_511[2];
    signal tmp_402[3];

    component cmul_109 = CMul();
    cmul_109.ina[0] <== challenges[4][0];
    cmul_109.ina[1] <== challenges[4][1];
    cmul_109.ina[2] <== challenges[4][2];
    cmul_109.inb[0] <== tmp_401[0];
    cmul_109.inb[1] <== tmp_401[1];
    cmul_109.inb[2] <== tmp_401[2];
    tmp_402[0] <== cmul_109.out[0];
    tmp_402[1] <== cmul_109.out[1];
    tmp_402[2] <== cmul_109.out[2];
    signal tmp_513[3];

    tmp_513[0] <== tmp_402[0] + tmp_512[0];
    tmp_513[1] <== tmp_402[1] + tmp_512[1];
    tmp_513[2] <== tmp_402[2] + tmp_512[2];

    signal xN[3] <== zMul[7].out;

    signal xAcc[8][3];
    signal qStep[7][3];
    signal qAcc[8][3];
    for (var i=0; i< 8; i++) {
        if (i==0) {
            xAcc[0] <== [1, 0, 0];
            qAcc[0] <== evals[51+i];
        } else {
            xAcc[i] <== CMul()(xAcc[i-1], xN);
            qStep[i-1] <== CMul()(xAcc[i], evals[51+i]);

            qAcc[i][0] <== qAcc[i-1][0] + qStep[i-1][0];
            qAcc[i][1] <== qAcc[i-1][1] + qStep[i-1][1];
            qAcc[i][2] <== qAcc[i-1][2] + qStep[i-1][2];
        }
    }

    signal qZ[3] <== CMul()(qAcc[7], Z);

// Final Verification
    enable * (tmp_513[0] - qZ[0]) === 0;
    enable * (tmp_513[1] - qZ[1]) === 0;
    enable * (tmp_513[2] - qZ[2]) === 0;
}

template VerifyQuery() {
    signal input ys[11];
    signal input challenges[8][3];
    signal input evals[59][3];
    signal input tree1[19];


    signal input tree4[24];
    signal input consts[16];
    signal output out[3];

///////////
// Mapping
///////////
    component mapValues = MapValues();

    for (var i=0; i< 19; i++ ) {
        mapValues.vals1[i] <== tree1[i];
    }
    for (var i=0; i< 24; i++ ) {
        mapValues.vals4[i] <== tree4[i];
    }

    signal xacc[11];
    xacc[0] <== ys[0]*(49 * roots(11)-49) + 49;
    for (var i=1; i<11; i++ ) {
        xacc[i] <== xacc[i-1] * ( ys[i]*(roots(11 - i) - 1) +1);
    }

    component den1inv = CInv();
    den1inv.in[0] <== xacc[10] - challenges[7][0];
    den1inv.in[1] <== -challenges[7][1];
    den1inv.in[2] <== -challenges[7][2];
    signal xDivXSubXi[3];
    xDivXSubXi[0] <== xacc[10] * den1inv.out[0];
    xDivXSubXi[1] <== xacc[10] * den1inv.out[1];
    xDivXSubXi[2] <== xacc[10] * den1inv.out[2];

    component den2inv = CInv();
    den2inv.in[0] <== xacc[10] - roots(8)*challenges[7][0];
    den2inv.in[1] <== -roots(8)*challenges[7][1];
    den2inv.in[2] <== -roots(8)*challenges[7][2];
    signal xDivXSubWXi[3];
    xDivXSubWXi[0] <== xacc[10] * den2inv.out[0];
    xDivXSubWXi[1] <== xacc[10] * den2inv.out[1];
    xDivXSubWXi[2] <== xacc[10] * den2inv.out[2];

        signal tmp_0[3];

    tmp_0[0] <== challenges[5][0] * mapValues.tree1_0;
    tmp_0[1] <== challenges[5][1] * mapValues.tree1_0;
    tmp_0[2] <== challenges[5][2] * mapValues.tree1_0;
    signal tmp_1[3];

    tmp_1[0] <== tmp_0[0] + mapValues.tree1_1;
    tmp_1[1] <== tmp_0[1];
    tmp_1[2] <== tmp_0[2];
    signal tmp_2[3];

    component cmul_0 = CMul();
    cmul_0.ina[0] <== challenges[5][0];
    cmul_0.ina[1] <== challenges[5][1];
    cmul_0.ina[2] <== challenges[5][2];
    cmul_0.inb[0] <== tmp_1[0];
    cmul_0.inb[1] <== tmp_1[1];
    cmul_0.inb[2] <== tmp_1[2];
    tmp_2[0] <== cmul_0.out[0];
    tmp_2[1] <== cmul_0.out[1];
    tmp_2[2] <== cmul_0.out[2];
    signal tmp_3[3];

    tmp_3[0] <== tmp_2[0] + mapValues.tree1_2;
    tmp_3[1] <== tmp_2[1];
    tmp_3[2] <== tmp_2[2];
    signal tmp_4[3];

    component cmul_1 = CMul();
    cmul_1.ina[0] <== challenges[5][0];
    cmul_1.ina[1] <== challenges[5][1];
    cmul_1.ina[2] <== challenges[5][2];
    cmul_1.inb[0] <== tmp_3[0];
    cmul_1.inb[1] <== tmp_3[1];
    cmul_1.inb[2] <== tmp_3[2];
    tmp_4[0] <== cmul_1.out[0];
    tmp_4[1] <== cmul_1.out[1];
    tmp_4[2] <== cmul_1.out[2];
    signal tmp_5[3];

    tmp_5[0] <== tmp_4[0] + mapValues.tree1_3;
    tmp_5[1] <== tmp_4[1];
    tmp_5[2] <== tmp_4[2];
    signal tmp_6[3];

    component cmul_2 = CMul();
    cmul_2.ina[0] <== challenges[5][0];
    cmul_2.ina[1] <== challenges[5][1];
    cmul_2.ina[2] <== challenges[5][2];
    cmul_2.inb[0] <== tmp_5[0];
    cmul_2.inb[1] <== tmp_5[1];
    cmul_2.inb[2] <== tmp_5[2];
    tmp_6[0] <== cmul_2.out[0];
    tmp_6[1] <== cmul_2.out[1];
    tmp_6[2] <== cmul_2.out[2];
    signal tmp_7[3];

    tmp_7[0] <== tmp_6[0] + mapValues.tree1_4;
    tmp_7[1] <== tmp_6[1];
    tmp_7[2] <== tmp_6[2];
    signal tmp_8[3];

    component cmul_3 = CMul();
    cmul_3.ina[0] <== challenges[5][0];
    cmul_3.ina[1] <== challenges[5][1];
    cmul_3.ina[2] <== challenges[5][2];
    cmul_3.inb[0] <== tmp_7[0];
    cmul_3.inb[1] <== tmp_7[1];
    cmul_3.inb[2] <== tmp_7[2];
    tmp_8[0] <== cmul_3.out[0];
    tmp_8[1] <== cmul_3.out[1];
    tmp_8[2] <== cmul_3.out[2];
    signal tmp_9[3];

    tmp_9[0] <== tmp_8[0] + mapValues.tree1_5;
    tmp_9[1] <== tmp_8[1];
    tmp_9[2] <== tmp_8[2];
    signal tmp_10[3];

    component cmul_4 = CMul();
    cmul_4.ina[0] <== challenges[5][0];
    cmul_4.ina[1] <== challenges[5][1];
    cmul_4.ina[2] <== challenges[5][2];
    cmul_4.inb[0] <== tmp_9[0];
    cmul_4.inb[1] <== tmp_9[1];
    cmul_4.inb[2] <== tmp_9[2];
    tmp_10[0] <== cmul_4.out[0];
    tmp_10[1] <== cmul_4.out[1];
    tmp_10[2] <== cmul_4.out[2];
    signal tmp_11[3];

    tmp_11[0] <== tmp_10[0] + mapValues.tree1_6;
    tmp_11[1] <== tmp_10[1];
    tmp_11[2] <== tmp_10[2];
    signal tmp_12[3];

    component cmul_5 = CMul();
    cmul_5.ina[0] <== challenges[5][0];
    cmul_5.ina[1] <== challenges[5][1];
    cmul_5.ina[2] <== challenges[5][2];
    cmul_5.inb[0] <== tmp_11[0];
    cmul_5.inb[1] <== tmp_11[1];
    cmul_5.inb[2] <== tmp_11[2];
    tmp_12[0] <== cmul_5.out[0];
    tmp_12[1] <== cmul_5.out[1];
    tmp_12[2] <== cmul_5.out[2];
    signal tmp_13[3];

    tmp_13[0] <== tmp_12[0] + mapValues.tree1_7;
    tmp_13[1] <== tmp_12[1];
    tmp_13[2] <== tmp_12[2];
    signal tmp_14[3];

    component cmul_6 = CMul();
    cmul_6.ina[0] <== challenges[5][0];
    cmul_6.ina[1] <== challenges[5][1];
    cmul_6.ina[2] <== challenges[5][2];
    cmul_6.inb[0] <== tmp_13[0];
    cmul_6.inb[1] <== tmp_13[1];
    cmul_6.inb[2] <== tmp_13[2];
    tmp_14[0] <== cmul_6.out[0];
    tmp_14[1] <== cmul_6.out[1];
    tmp_14[2] <== cmul_6.out[2];
    signal tmp_15[3];

    tmp_15[0] <== tmp_14[0] + mapValues.tree1_8;
    tmp_15[1] <== tmp_14[1];
    tmp_15[2] <== tmp_14[2];
    signal tmp_16[3];

    component cmul_7 = CMul();
    cmul_7.ina[0] <== challenges[5][0];
    cmul_7.ina[1] <== challenges[5][1];
    cmul_7.ina[2] <== challenges[5][2];
    cmul_7.inb[0] <== tmp_15[0];
    cmul_7.inb[1] <== tmp_15[1];
    cmul_7.inb[2] <== tmp_15[2];
    tmp_16[0] <== cmul_7.out[0];
    tmp_16[1] <== cmul_7.out[1];
    tmp_16[2] <== cmul_7.out[2];
    signal tmp_17[3];

    tmp_17[0] <== tmp_16[0] + mapValues.tree1_9;
    tmp_17[1] <== tmp_16[1];
    tmp_17[2] <== tmp_16[2];
    signal tmp_18[3];

    component cmul_8 = CMul();
    cmul_8.ina[0] <== challenges[5][0];
    cmul_8.ina[1] <== challenges[5][1];
    cmul_8.ina[2] <== challenges[5][2];
    cmul_8.inb[0] <== tmp_17[0];
    cmul_8.inb[1] <== tmp_17[1];
    cmul_8.inb[2] <== tmp_17[2];
    tmp_18[0] <== cmul_8.out[0];
    tmp_18[1] <== cmul_8.out[1];
    tmp_18[2] <== cmul_8.out[2];
    signal tmp_19[3];

    tmp_19[0] <== tmp_18[0] + mapValues.tree1_10;
    tmp_19[1] <== tmp_18[1];
    tmp_19[2] <== tmp_18[2];
    signal tmp_20[3];

    component cmul_9 = CMul();
    cmul_9.ina[0] <== challenges[5][0];
    cmul_9.ina[1] <== challenges[5][1];
    cmul_9.ina[2] <== challenges[5][2];
    cmul_9.inb[0] <== tmp_19[0];
    cmul_9.inb[1] <== tmp_19[1];
    cmul_9.inb[2] <== tmp_19[2];
    tmp_20[0] <== cmul_9.out[0];
    tmp_20[1] <== cmul_9.out[1];
    tmp_20[2] <== cmul_9.out[2];
    signal tmp_21[3];

    tmp_21[0] <== tmp_20[0] + mapValues.tree1_11;
    tmp_21[1] <== tmp_20[1];
    tmp_21[2] <== tmp_20[2];
    signal tmp_22[3];

    component cmul_10 = CMul();
    cmul_10.ina[0] <== challenges[5][0];
    cmul_10.ina[1] <== challenges[5][1];
    cmul_10.ina[2] <== challenges[5][2];
    cmul_10.inb[0] <== tmp_21[0];
    cmul_10.inb[1] <== tmp_21[1];
    cmul_10.inb[2] <== tmp_21[2];
    tmp_22[0] <== cmul_10.out[0];
    tmp_22[1] <== cmul_10.out[1];
    tmp_22[2] <== cmul_10.out[2];
    signal tmp_23[3];

    tmp_23[0] <== tmp_22[0] + mapValues.tree1_12;
    tmp_23[1] <== tmp_22[1];
    tmp_23[2] <== tmp_22[2];
    signal tmp_24[3];

    component cmul_11 = CMul();
    cmul_11.ina[0] <== challenges[5][0];
    cmul_11.ina[1] <== challenges[5][1];
    cmul_11.ina[2] <== challenges[5][2];
    cmul_11.inb[0] <== tmp_23[0];
    cmul_11.inb[1] <== tmp_23[1];
    cmul_11.inb[2] <== tmp_23[2];
    tmp_24[0] <== cmul_11.out[0];
    tmp_24[1] <== cmul_11.out[1];
    tmp_24[2] <== cmul_11.out[2];
    signal tmp_25[3];

    tmp_25[0] <== tmp_24[0] + mapValues.tree1_13;
    tmp_25[1] <== tmp_24[1];
    tmp_25[2] <== tmp_24[2];
    signal tmp_26[3];

    component cmul_12 = CMul();
    cmul_12.ina[0] <== challenges[5][0];
    cmul_12.ina[1] <== challenges[5][1];
    cmul_12.ina[2] <== challenges[5][2];
    cmul_12.inb[0] <== tmp_25[0];
    cmul_12.inb[1] <== tmp_25[1];
    cmul_12.inb[2] <== tmp_25[2];
    tmp_26[0] <== cmul_12.out[0];
    tmp_26[1] <== cmul_12.out[1];
    tmp_26[2] <== cmul_12.out[2];
    signal tmp_27[3];

    tmp_27[0] <== tmp_26[0] + mapValues.tree1_14;
    tmp_27[1] <== tmp_26[1];
    tmp_27[2] <== tmp_26[2];
    signal tmp_28[3];

    component cmul_13 = CMul();
    cmul_13.ina[0] <== challenges[5][0];
    cmul_13.ina[1] <== challenges[5][1];
    cmul_13.ina[2] <== challenges[5][2];
    cmul_13.inb[0] <== tmp_27[0];
    cmul_13.inb[1] <== tmp_27[1];
    cmul_13.inb[2] <== tmp_27[2];
    tmp_28[0] <== cmul_13.out[0];
    tmp_28[1] <== cmul_13.out[1];
    tmp_28[2] <== cmul_13.out[2];
    signal tmp_29[3];

    tmp_29[0] <== tmp_28[0] + mapValues.tree1_15;
    tmp_29[1] <== tmp_28[1];
    tmp_29[2] <== tmp_28[2];
    signal tmp_30[3];

    component cmul_14 = CMul();
    cmul_14.ina[0] <== challenges[5][0];
    cmul_14.ina[1] <== challenges[5][1];
    cmul_14.ina[2] <== challenges[5][2];
    cmul_14.inb[0] <== tmp_29[0];
    cmul_14.inb[1] <== tmp_29[1];
    cmul_14.inb[2] <== tmp_29[2];
    tmp_30[0] <== cmul_14.out[0];
    tmp_30[1] <== cmul_14.out[1];
    tmp_30[2] <== cmul_14.out[2];
    signal tmp_31[3];

    tmp_31[0] <== tmp_30[0] + mapValues.tree1_16;
    tmp_31[1] <== tmp_30[1];
    tmp_31[2] <== tmp_30[2];
    signal tmp_32[3];

    component cmul_15 = CMul();
    cmul_15.ina[0] <== challenges[5][0];
    cmul_15.ina[1] <== challenges[5][1];
    cmul_15.ina[2] <== challenges[5][2];
    cmul_15.inb[0] <== tmp_31[0];
    cmul_15.inb[1] <== tmp_31[1];
    cmul_15.inb[2] <== tmp_31[2];
    tmp_32[0] <== cmul_15.out[0];
    tmp_32[1] <== cmul_15.out[1];
    tmp_32[2] <== cmul_15.out[2];
    signal tmp_33[3];

    tmp_33[0] <== tmp_32[0] + mapValues.tree1_17;
    tmp_33[1] <== tmp_32[1];
    tmp_33[2] <== tmp_32[2];
    signal tmp_34[3];

    component cmul_16 = CMul();
    cmul_16.ina[0] <== challenges[5][0];
    cmul_16.ina[1] <== challenges[5][1];
    cmul_16.ina[2] <== challenges[5][2];
    cmul_16.inb[0] <== tmp_33[0];
    cmul_16.inb[1] <== tmp_33[1];
    cmul_16.inb[2] <== tmp_33[2];
    tmp_34[0] <== cmul_16.out[0];
    tmp_34[1] <== cmul_16.out[1];
    tmp_34[2] <== cmul_16.out[2];
    signal tmp_35[3];

    tmp_35[0] <== tmp_34[0] + mapValues.tree1_18;
    tmp_35[1] <== tmp_34[1];
    tmp_35[2] <== tmp_34[2];
    signal tmp_36[3];

    component cmul_17 = CMul();
    cmul_17.ina[0] <== challenges[5][0];
    cmul_17.ina[1] <== challenges[5][1];
    cmul_17.ina[2] <== challenges[5][2];
    cmul_17.inb[0] <== tmp_35[0];
    cmul_17.inb[1] <== tmp_35[1];
    cmul_17.inb[2] <== tmp_35[2];
    tmp_36[0] <== cmul_17.out[0];
    tmp_36[1] <== cmul_17.out[1];
    tmp_36[2] <== cmul_17.out[2];
    signal tmp_37[3];

    tmp_37[0] <== tmp_36[0] + mapValues.tree4_0[0];
    tmp_37[1] <== tmp_36[1] + mapValues.tree4_0[1];
    tmp_37[2] <== tmp_36[2] + mapValues.tree4_0[2];
    signal tmp_38[3];

    component cmul_18 = CMul();
    cmul_18.ina[0] <== challenges[5][0];
    cmul_18.ina[1] <== challenges[5][1];
    cmul_18.ina[2] <== challenges[5][2];
    cmul_18.inb[0] <== tmp_37[0];
    cmul_18.inb[1] <== tmp_37[1];
    cmul_18.inb[2] <== tmp_37[2];
    tmp_38[0] <== cmul_18.out[0];
    tmp_38[1] <== cmul_18.out[1];
    tmp_38[2] <== cmul_18.out[2];
    signal tmp_39[3];

    tmp_39[0] <== tmp_38[0] + mapValues.tree4_1[0];
    tmp_39[1] <== tmp_38[1] + mapValues.tree4_1[1];
    tmp_39[2] <== tmp_38[2] + mapValues.tree4_1[2];
    signal tmp_40[3];

    component cmul_19 = CMul();
    cmul_19.ina[0] <== challenges[5][0];
    cmul_19.ina[1] <== challenges[5][1];
    cmul_19.ina[2] <== challenges[5][2];
    cmul_19.inb[0] <== tmp_39[0];
    cmul_19.inb[1] <== tmp_39[1];
    cmul_19.inb[2] <== tmp_39[2];
    tmp_40[0] <== cmul_19.out[0];
    tmp_40[1] <== cmul_19.out[1];
    tmp_40[2] <== cmul_19.out[2];
    signal tmp_41[3];

    tmp_41[0] <== tmp_40[0] + mapValues.tree4_2[0];
    tmp_41[1] <== tmp_40[1] + mapValues.tree4_2[1];
    tmp_41[2] <== tmp_40[2] + mapValues.tree4_2[2];
    signal tmp_42[3];

    component cmul_20 = CMul();
    cmul_20.ina[0] <== challenges[5][0];
    cmul_20.ina[1] <== challenges[5][1];
    cmul_20.ina[2] <== challenges[5][2];
    cmul_20.inb[0] <== tmp_41[0];
    cmul_20.inb[1] <== tmp_41[1];
    cmul_20.inb[2] <== tmp_41[2];
    tmp_42[0] <== cmul_20.out[0];
    tmp_42[1] <== cmul_20.out[1];
    tmp_42[2] <== cmul_20.out[2];
    signal tmp_43[3];

    tmp_43[0] <== tmp_42[0] + mapValues.tree4_3[0];
    tmp_43[1] <== tmp_42[1] + mapValues.tree4_3[1];
    tmp_43[2] <== tmp_42[2] + mapValues.tree4_3[2];
    signal tmp_44[3];

    component cmul_21 = CMul();
    cmul_21.ina[0] <== challenges[5][0];
    cmul_21.ina[1] <== challenges[5][1];
    cmul_21.ina[2] <== challenges[5][2];
    cmul_21.inb[0] <== tmp_43[0];
    cmul_21.inb[1] <== tmp_43[1];
    cmul_21.inb[2] <== tmp_43[2];
    tmp_44[0] <== cmul_21.out[0];
    tmp_44[1] <== cmul_21.out[1];
    tmp_44[2] <== cmul_21.out[2];
    signal tmp_45[3];

    tmp_45[0] <== tmp_44[0] + mapValues.tree4_4[0];
    tmp_45[1] <== tmp_44[1] + mapValues.tree4_4[1];
    tmp_45[2] <== tmp_44[2] + mapValues.tree4_4[2];
    signal tmp_46[3];

    component cmul_22 = CMul();
    cmul_22.ina[0] <== challenges[5][0];
    cmul_22.ina[1] <== challenges[5][1];
    cmul_22.ina[2] <== challenges[5][2];
    cmul_22.inb[0] <== tmp_45[0];
    cmul_22.inb[1] <== tmp_45[1];
    cmul_22.inb[2] <== tmp_45[2];
    tmp_46[0] <== cmul_22.out[0];
    tmp_46[1] <== cmul_22.out[1];
    tmp_46[2] <== cmul_22.out[2];
    signal tmp_47[3];

    tmp_47[0] <== tmp_46[0] + mapValues.tree4_5[0];
    tmp_47[1] <== tmp_46[1] + mapValues.tree4_5[1];
    tmp_47[2] <== tmp_46[2] + mapValues.tree4_5[2];
    signal tmp_48[3];

    component cmul_23 = CMul();
    cmul_23.ina[0] <== challenges[5][0];
    cmul_23.ina[1] <== challenges[5][1];
    cmul_23.ina[2] <== challenges[5][2];
    cmul_23.inb[0] <== tmp_47[0];
    cmul_23.inb[1] <== tmp_47[1];
    cmul_23.inb[2] <== tmp_47[2];
    tmp_48[0] <== cmul_23.out[0];
    tmp_48[1] <== cmul_23.out[1];
    tmp_48[2] <== cmul_23.out[2];
    signal tmp_49[3];

    tmp_49[0] <== tmp_48[0] + mapValues.tree4_6[0];
    tmp_49[1] <== tmp_48[1] + mapValues.tree4_6[1];
    tmp_49[2] <== tmp_48[2] + mapValues.tree4_6[2];
    signal tmp_50[3];

    component cmul_24 = CMul();
    cmul_24.ina[0] <== challenges[5][0];
    cmul_24.ina[1] <== challenges[5][1];
    cmul_24.ina[2] <== challenges[5][2];
    cmul_24.inb[0] <== tmp_49[0];
    cmul_24.inb[1] <== tmp_49[1];
    cmul_24.inb[2] <== tmp_49[2];
    tmp_50[0] <== cmul_24.out[0];
    tmp_50[1] <== cmul_24.out[1];
    tmp_50[2] <== cmul_24.out[2];
    signal tmp_51[3];

    tmp_51[0] <== tmp_50[0] + mapValues.tree4_7[0];
    tmp_51[1] <== tmp_50[1] + mapValues.tree4_7[1];
    tmp_51[2] <== tmp_50[2] + mapValues.tree4_7[2];
    signal tmp_52[3];

    component cmul_25 = CMul();
    cmul_25.ina[0] <== challenges[5][0];
    cmul_25.ina[1] <== challenges[5][1];
    cmul_25.ina[2] <== challenges[5][2];
    cmul_25.inb[0] <== tmp_51[0];
    cmul_25.inb[1] <== tmp_51[1];
    cmul_25.inb[2] <== tmp_51[2];
    tmp_52[0] <== cmul_25.out[0];
    tmp_52[1] <== cmul_25.out[1];
    tmp_52[2] <== cmul_25.out[2];
    signal tmp_53[3];

    tmp_53[0] <== mapValues.tree1_0 - evals[0][0];
    tmp_53[1] <== -evals[0][1];
    tmp_53[2] <== -evals[0][2];
    signal tmp_54[3];

    component cmul_26 = CMul();
    cmul_26.ina[0] <== tmp_53[0];
    cmul_26.ina[1] <== tmp_53[1];
    cmul_26.ina[2] <== tmp_53[2];
    cmul_26.inb[0] <== challenges[6][0];
    cmul_26.inb[1] <== challenges[6][1];
    cmul_26.inb[2] <== challenges[6][2];
    tmp_54[0] <== cmul_26.out[0];
    tmp_54[1] <== cmul_26.out[1];
    tmp_54[2] <== cmul_26.out[2];
    signal tmp_55[3];

    tmp_55[0] <== consts[4] - evals[1][0];
    tmp_55[1] <== -evals[1][1];
    tmp_55[2] <== -evals[1][2];
    signal tmp_56[3];

    tmp_56[0] <== tmp_54[0] + tmp_55[0];
    tmp_56[1] <== tmp_54[1] + tmp_55[1];
    tmp_56[2] <== tmp_54[2] + tmp_55[2];
    signal tmp_57[3];

    component cmul_27 = CMul();
    cmul_27.ina[0] <== tmp_56[0];
    cmul_27.ina[1] <== tmp_56[1];
    cmul_27.ina[2] <== tmp_56[2];
    cmul_27.inb[0] <== challenges[6][0];
    cmul_27.inb[1] <== challenges[6][1];
    cmul_27.inb[2] <== challenges[6][2];
    tmp_57[0] <== cmul_27.out[0];
    tmp_57[1] <== cmul_27.out[1];
    tmp_57[2] <== cmul_27.out[2];
    signal tmp_58[3];

    tmp_58[0] <== mapValues.tree1_1 - evals[2][0];
    tmp_58[1] <== -evals[2][1];
    tmp_58[2] <== -evals[2][2];
    signal tmp_59[3];

    tmp_59[0] <== tmp_57[0] + tmp_58[0];
    tmp_59[1] <== tmp_57[1] + tmp_58[1];
    tmp_59[2] <== tmp_57[2] + tmp_58[2];
    signal tmp_60[3];

    component cmul_28 = CMul();
    cmul_28.ina[0] <== tmp_59[0];
    cmul_28.ina[1] <== tmp_59[1];
    cmul_28.ina[2] <== tmp_59[2];
    cmul_28.inb[0] <== challenges[6][0];
    cmul_28.inb[1] <== challenges[6][1];
    cmul_28.inb[2] <== challenges[6][2];
    tmp_60[0] <== cmul_28.out[0];
    tmp_60[1] <== cmul_28.out[1];
    tmp_60[2] <== cmul_28.out[2];
    signal tmp_61[3];

    tmp_61[0] <== consts[5] - evals[3][0];
    tmp_61[1] <== -evals[3][1];
    tmp_61[2] <== -evals[3][2];
    signal tmp_62[3];

    tmp_62[0] <== tmp_60[0] + tmp_61[0];
    tmp_62[1] <== tmp_60[1] + tmp_61[1];
    tmp_62[2] <== tmp_60[2] + tmp_61[2];
    signal tmp_63[3];

    component cmul_29 = CMul();
    cmul_29.ina[0] <== tmp_62[0];
    cmul_29.ina[1] <== tmp_62[1];
    cmul_29.ina[2] <== tmp_62[2];
    cmul_29.inb[0] <== challenges[6][0];
    cmul_29.inb[1] <== challenges[6][1];
    cmul_29.inb[2] <== challenges[6][2];
    tmp_63[0] <== cmul_29.out[0];
    tmp_63[1] <== cmul_29.out[1];
    tmp_63[2] <== cmul_29.out[2];
    signal tmp_64[3];

    tmp_64[0] <== consts[3] - evals[4][0];
    tmp_64[1] <== -evals[4][1];
    tmp_64[2] <== -evals[4][2];
    signal tmp_65[3];

    tmp_65[0] <== tmp_63[0] + tmp_64[0];
    tmp_65[1] <== tmp_63[1] + tmp_64[1];
    tmp_65[2] <== tmp_63[2] + tmp_64[2];
    signal tmp_66[3];

    component cmul_30 = CMul();
    cmul_30.ina[0] <== tmp_65[0];
    cmul_30.ina[1] <== tmp_65[1];
    cmul_30.ina[2] <== tmp_65[2];
    cmul_30.inb[0] <== challenges[6][0];
    cmul_30.inb[1] <== challenges[6][1];
    cmul_30.inb[2] <== challenges[6][2];
    tmp_66[0] <== cmul_30.out[0];
    tmp_66[1] <== cmul_30.out[1];
    tmp_66[2] <== cmul_30.out[2];
    signal tmp_67[3];

    tmp_67[0] <== mapValues.tree1_2 - evals[5][0];
    tmp_67[1] <== -evals[5][1];
    tmp_67[2] <== -evals[5][2];
    signal tmp_68[3];

    tmp_68[0] <== tmp_66[0] + tmp_67[0];
    tmp_68[1] <== tmp_66[1] + tmp_67[1];
    tmp_68[2] <== tmp_66[2] + tmp_67[2];
    signal tmp_69[3];

    component cmul_31 = CMul();
    cmul_31.ina[0] <== tmp_68[0];
    cmul_31.ina[1] <== tmp_68[1];
    cmul_31.ina[2] <== tmp_68[2];
    cmul_31.inb[0] <== challenges[6][0];
    cmul_31.inb[1] <== challenges[6][1];
    cmul_31.inb[2] <== challenges[6][2];
    tmp_69[0] <== cmul_31.out[0];
    tmp_69[1] <== cmul_31.out[1];
    tmp_69[2] <== cmul_31.out[2];
    signal tmp_70[3];

    tmp_70[0] <== consts[6] - evals[6][0];
    tmp_70[1] <== -evals[6][1];
    tmp_70[2] <== -evals[6][2];
    signal tmp_71[3];

    tmp_71[0] <== tmp_69[0] + tmp_70[0];
    tmp_71[1] <== tmp_69[1] + tmp_70[1];
    tmp_71[2] <== tmp_69[2] + tmp_70[2];
    signal tmp_72[3];

    component cmul_32 = CMul();
    cmul_32.ina[0] <== tmp_71[0];
    cmul_32.ina[1] <== tmp_71[1];
    cmul_32.ina[2] <== tmp_71[2];
    cmul_32.inb[0] <== challenges[6][0];
    cmul_32.inb[1] <== challenges[6][1];
    cmul_32.inb[2] <== challenges[6][2];
    tmp_72[0] <== cmul_32.out[0];
    tmp_72[1] <== cmul_32.out[1];
    tmp_72[2] <== cmul_32.out[2];
    signal tmp_73[3];

    tmp_73[0] <== mapValues.tree1_3 - evals[7][0];
    tmp_73[1] <== -evals[7][1];
    tmp_73[2] <== -evals[7][2];
    signal tmp_74[3];

    tmp_74[0] <== tmp_72[0] + tmp_73[0];
    tmp_74[1] <== tmp_72[1] + tmp_73[1];
    tmp_74[2] <== tmp_72[2] + tmp_73[2];
    signal tmp_75[3];

    component cmul_33 = CMul();
    cmul_33.ina[0] <== tmp_74[0];
    cmul_33.ina[1] <== tmp_74[1];
    cmul_33.ina[2] <== tmp_74[2];
    cmul_33.inb[0] <== challenges[6][0];
    cmul_33.inb[1] <== challenges[6][1];
    cmul_33.inb[2] <== challenges[6][2];
    tmp_75[0] <== cmul_33.out[0];
    tmp_75[1] <== cmul_33.out[1];
    tmp_75[2] <== cmul_33.out[2];
    signal tmp_76[3];

    tmp_76[0] <== consts[7] - evals[8][0];
    tmp_76[1] <== -evals[8][1];
    tmp_76[2] <== -evals[8][2];
    signal tmp_77[3];

    tmp_77[0] <== tmp_75[0] + tmp_76[0];
    tmp_77[1] <== tmp_75[1] + tmp_76[1];
    tmp_77[2] <== tmp_75[2] + tmp_76[2];
    signal tmp_78[3];

    component cmul_34 = CMul();
    cmul_34.ina[0] <== tmp_77[0];
    cmul_34.ina[1] <== tmp_77[1];
    cmul_34.ina[2] <== tmp_77[2];
    cmul_34.inb[0] <== challenges[6][0];
    cmul_34.inb[1] <== challenges[6][1];
    cmul_34.inb[2] <== challenges[6][2];
    tmp_78[0] <== cmul_34.out[0];
    tmp_78[1] <== cmul_34.out[1];
    tmp_78[2] <== cmul_34.out[2];
    signal tmp_79[3];

    tmp_79[0] <== mapValues.tree1_4 - evals[9][0];
    tmp_79[1] <== -evals[9][1];
    tmp_79[2] <== -evals[9][2];
    signal tmp_80[3];

    tmp_80[0] <== tmp_78[0] + tmp_79[0];
    tmp_80[1] <== tmp_78[1] + tmp_79[1];
    tmp_80[2] <== tmp_78[2] + tmp_79[2];
    signal tmp_81[3];

    component cmul_35 = CMul();
    cmul_35.ina[0] <== tmp_80[0];
    cmul_35.ina[1] <== tmp_80[1];
    cmul_35.ina[2] <== tmp_80[2];
    cmul_35.inb[0] <== challenges[6][0];
    cmul_35.inb[1] <== challenges[6][1];
    cmul_35.inb[2] <== challenges[6][2];
    tmp_81[0] <== cmul_35.out[0];
    tmp_81[1] <== cmul_35.out[1];
    tmp_81[2] <== cmul_35.out[2];
    signal tmp_82[3];

    tmp_82[0] <== consts[8] - evals[10][0];
    tmp_82[1] <== -evals[10][1];
    tmp_82[2] <== -evals[10][2];
    signal tmp_83[3];

    tmp_83[0] <== tmp_81[0] + tmp_82[0];
    tmp_83[1] <== tmp_81[1] + tmp_82[1];
    tmp_83[2] <== tmp_81[2] + tmp_82[2];
    signal tmp_84[3];

    component cmul_36 = CMul();
    cmul_36.ina[0] <== tmp_83[0];
    cmul_36.ina[1] <== tmp_83[1];
    cmul_36.ina[2] <== tmp_83[2];
    cmul_36.inb[0] <== challenges[6][0];
    cmul_36.inb[1] <== challenges[6][1];
    cmul_36.inb[2] <== challenges[6][2];
    tmp_84[0] <== cmul_36.out[0];
    tmp_84[1] <== cmul_36.out[1];
    tmp_84[2] <== cmul_36.out[2];
    signal tmp_85[3];

    tmp_85[0] <== mapValues.tree1_5 - evals[11][0];
    tmp_85[1] <== -evals[11][1];
    tmp_85[2] <== -evals[11][2];
    signal tmp_86[3];

    tmp_86[0] <== tmp_84[0] + tmp_85[0];
    tmp_86[1] <== tmp_84[1] + tmp_85[1];
    tmp_86[2] <== tmp_84[2] + tmp_85[2];
    signal tmp_87[3];

    component cmul_37 = CMul();
    cmul_37.ina[0] <== tmp_86[0];
    cmul_37.ina[1] <== tmp_86[1];
    cmul_37.ina[2] <== tmp_86[2];
    cmul_37.inb[0] <== challenges[6][0];
    cmul_37.inb[1] <== challenges[6][1];
    cmul_37.inb[2] <== challenges[6][2];
    tmp_87[0] <== cmul_37.out[0];
    tmp_87[1] <== cmul_37.out[1];
    tmp_87[2] <== cmul_37.out[2];
    signal tmp_88[3];

    tmp_88[0] <== consts[9] - evals[12][0];
    tmp_88[1] <== -evals[12][1];
    tmp_88[2] <== -evals[12][2];
    signal tmp_89[3];

    tmp_89[0] <== tmp_87[0] + tmp_88[0];
    tmp_89[1] <== tmp_87[1] + tmp_88[1];
    tmp_89[2] <== tmp_87[2] + tmp_88[2];
    signal tmp_90[3];

    component cmul_38 = CMul();
    cmul_38.ina[0] <== tmp_89[0];
    cmul_38.ina[1] <== tmp_89[1];
    cmul_38.ina[2] <== tmp_89[2];
    cmul_38.inb[0] <== challenges[6][0];
    cmul_38.inb[1] <== challenges[6][1];
    cmul_38.inb[2] <== challenges[6][2];
    tmp_90[0] <== cmul_38.out[0];
    tmp_90[1] <== cmul_38.out[1];
    tmp_90[2] <== cmul_38.out[2];
    signal tmp_91[3];

    tmp_91[0] <== mapValues.tree1_6 - evals[13][0];
    tmp_91[1] <== -evals[13][1];
    tmp_91[2] <== -evals[13][2];
    signal tmp_92[3];

    tmp_92[0] <== tmp_90[0] + tmp_91[0];
    tmp_92[1] <== tmp_90[1] + tmp_91[1];
    tmp_92[2] <== tmp_90[2] + tmp_91[2];
    signal tmp_93[3];

    component cmul_39 = CMul();
    cmul_39.ina[0] <== tmp_92[0];
    cmul_39.ina[1] <== tmp_92[1];
    cmul_39.ina[2] <== tmp_92[2];
    cmul_39.inb[0] <== challenges[6][0];
    cmul_39.inb[1] <== challenges[6][1];
    cmul_39.inb[2] <== challenges[6][2];
    tmp_93[0] <== cmul_39.out[0];
    tmp_93[1] <== cmul_39.out[1];
    tmp_93[2] <== cmul_39.out[2];
    signal tmp_94[3];

    tmp_94[0] <== consts[10] - evals[14][0];
    tmp_94[1] <== -evals[14][1];
    tmp_94[2] <== -evals[14][2];
    signal tmp_95[3];

    tmp_95[0] <== tmp_93[0] + tmp_94[0];
    tmp_95[1] <== tmp_93[1] + tmp_94[1];
    tmp_95[2] <== tmp_93[2] + tmp_94[2];
    signal tmp_96[3];

    component cmul_40 = CMul();
    cmul_40.ina[0] <== tmp_95[0];
    cmul_40.ina[1] <== tmp_95[1];
    cmul_40.ina[2] <== tmp_95[2];
    cmul_40.inb[0] <== challenges[6][0];
    cmul_40.inb[1] <== challenges[6][1];
    cmul_40.inb[2] <== challenges[6][2];
    tmp_96[0] <== cmul_40.out[0];
    tmp_96[1] <== cmul_40.out[1];
    tmp_96[2] <== cmul_40.out[2];
    signal tmp_97[3];

    tmp_97[0] <== mapValues.tree1_7 - evals[15][0];
    tmp_97[1] <== -evals[15][1];
    tmp_97[2] <== -evals[15][2];
    signal tmp_98[3];

    tmp_98[0] <== tmp_96[0] + tmp_97[0];
    tmp_98[1] <== tmp_96[1] + tmp_97[1];
    tmp_98[2] <== tmp_96[2] + tmp_97[2];
    signal tmp_99[3];

    component cmul_41 = CMul();
    cmul_41.ina[0] <== tmp_98[0];
    cmul_41.ina[1] <== tmp_98[1];
    cmul_41.ina[2] <== tmp_98[2];
    cmul_41.inb[0] <== challenges[6][0];
    cmul_41.inb[1] <== challenges[6][1];
    cmul_41.inb[2] <== challenges[6][2];
    tmp_99[0] <== cmul_41.out[0];
    tmp_99[1] <== cmul_41.out[1];
    tmp_99[2] <== cmul_41.out[2];
    signal tmp_100[3];

    tmp_100[0] <== consts[11] - evals[16][0];
    tmp_100[1] <== -evals[16][1];
    tmp_100[2] <== -evals[16][2];
    signal tmp_101[3];

    tmp_101[0] <== tmp_99[0] + tmp_100[0];
    tmp_101[1] <== tmp_99[1] + tmp_100[1];
    tmp_101[2] <== tmp_99[2] + tmp_100[2];
    signal tmp_102[3];

    component cmul_42 = CMul();
    cmul_42.ina[0] <== tmp_101[0];
    cmul_42.ina[1] <== tmp_101[1];
    cmul_42.ina[2] <== tmp_101[2];
    cmul_42.inb[0] <== challenges[6][0];
    cmul_42.inb[1] <== challenges[6][1];
    cmul_42.inb[2] <== challenges[6][2];
    tmp_102[0] <== cmul_42.out[0];
    tmp_102[1] <== cmul_42.out[1];
    tmp_102[2] <== cmul_42.out[2];
    signal tmp_103[3];

    tmp_103[0] <== mapValues.tree1_8 - evals[17][0];
    tmp_103[1] <== -evals[17][1];
    tmp_103[2] <== -evals[17][2];
    signal tmp_104[3];

    tmp_104[0] <== tmp_102[0] + tmp_103[0];
    tmp_104[1] <== tmp_102[1] + tmp_103[1];
    tmp_104[2] <== tmp_102[2] + tmp_103[2];
    signal tmp_105[3];

    component cmul_43 = CMul();
    cmul_43.ina[0] <== tmp_104[0];
    cmul_43.ina[1] <== tmp_104[1];
    cmul_43.ina[2] <== tmp_104[2];
    cmul_43.inb[0] <== challenges[6][0];
    cmul_43.inb[1] <== challenges[6][1];
    cmul_43.inb[2] <== challenges[6][2];
    tmp_105[0] <== cmul_43.out[0];
    tmp_105[1] <== cmul_43.out[1];
    tmp_105[2] <== cmul_43.out[2];
    signal tmp_106[3];

    tmp_106[0] <== consts[12] - evals[18][0];
    tmp_106[1] <== -evals[18][1];
    tmp_106[2] <== -evals[18][2];
    signal tmp_107[3];

    tmp_107[0] <== tmp_105[0] + tmp_106[0];
    tmp_107[1] <== tmp_105[1] + tmp_106[1];
    tmp_107[2] <== tmp_105[2] + tmp_106[2];
    signal tmp_108[3];

    component cmul_44 = CMul();
    cmul_44.ina[0] <== tmp_107[0];
    cmul_44.ina[1] <== tmp_107[1];
    cmul_44.ina[2] <== tmp_107[2];
    cmul_44.inb[0] <== challenges[6][0];
    cmul_44.inb[1] <== challenges[6][1];
    cmul_44.inb[2] <== challenges[6][2];
    tmp_108[0] <== cmul_44.out[0];
    tmp_108[1] <== cmul_44.out[1];
    tmp_108[2] <== cmul_44.out[2];
    signal tmp_109[3];

    tmp_109[0] <== mapValues.tree1_9 - evals[19][0];
    tmp_109[1] <== -evals[19][1];
    tmp_109[2] <== -evals[19][2];
    signal tmp_110[3];

    tmp_110[0] <== tmp_108[0] + tmp_109[0];
    tmp_110[1] <== tmp_108[1] + tmp_109[1];
    tmp_110[2] <== tmp_108[2] + tmp_109[2];
    signal tmp_111[3];

    component cmul_45 = CMul();
    cmul_45.ina[0] <== tmp_110[0];
    cmul_45.ina[1] <== tmp_110[1];
    cmul_45.ina[2] <== tmp_110[2];
    cmul_45.inb[0] <== challenges[6][0];
    cmul_45.inb[1] <== challenges[6][1];
    cmul_45.inb[2] <== challenges[6][2];
    tmp_111[0] <== cmul_45.out[0];
    tmp_111[1] <== cmul_45.out[1];
    tmp_111[2] <== cmul_45.out[2];
    signal tmp_112[3];

    tmp_112[0] <== consts[13] - evals[20][0];
    tmp_112[1] <== -evals[20][1];
    tmp_112[2] <== -evals[20][2];
    signal tmp_113[3];

    tmp_113[0] <== tmp_111[0] + tmp_112[0];
    tmp_113[1] <== tmp_111[1] + tmp_112[1];
    tmp_113[2] <== tmp_111[2] + tmp_112[2];
    signal tmp_114[3];

    component cmul_46 = CMul();
    cmul_46.ina[0] <== tmp_113[0];
    cmul_46.ina[1] <== tmp_113[1];
    cmul_46.ina[2] <== tmp_113[2];
    cmul_46.inb[0] <== challenges[6][0];
    cmul_46.inb[1] <== challenges[6][1];
    cmul_46.inb[2] <== challenges[6][2];
    tmp_114[0] <== cmul_46.out[0];
    tmp_114[1] <== cmul_46.out[1];
    tmp_114[2] <== cmul_46.out[2];
    signal tmp_115[3];

    tmp_115[0] <== mapValues.tree1_10 - evals[21][0];
    tmp_115[1] <== -evals[21][1];
    tmp_115[2] <== -evals[21][2];
    signal tmp_116[3];

    tmp_116[0] <== tmp_114[0] + tmp_115[0];
    tmp_116[1] <== tmp_114[1] + tmp_115[1];
    tmp_116[2] <== tmp_114[2] + tmp_115[2];
    signal tmp_117[3];

    component cmul_47 = CMul();
    cmul_47.ina[0] <== tmp_116[0];
    cmul_47.ina[1] <== tmp_116[1];
    cmul_47.ina[2] <== tmp_116[2];
    cmul_47.inb[0] <== challenges[6][0];
    cmul_47.inb[1] <== challenges[6][1];
    cmul_47.inb[2] <== challenges[6][2];
    tmp_117[0] <== cmul_47.out[0];
    tmp_117[1] <== cmul_47.out[1];
    tmp_117[2] <== cmul_47.out[2];
    signal tmp_118[3];

    tmp_118[0] <== consts[14] - evals[22][0];
    tmp_118[1] <== -evals[22][1];
    tmp_118[2] <== -evals[22][2];
    signal tmp_119[3];

    tmp_119[0] <== tmp_117[0] + tmp_118[0];
    tmp_119[1] <== tmp_117[1] + tmp_118[1];
    tmp_119[2] <== tmp_117[2] + tmp_118[2];
    signal tmp_120[3];

    component cmul_48 = CMul();
    cmul_48.ina[0] <== tmp_119[0];
    cmul_48.ina[1] <== tmp_119[1];
    cmul_48.ina[2] <== tmp_119[2];
    cmul_48.inb[0] <== challenges[6][0];
    cmul_48.inb[1] <== challenges[6][1];
    cmul_48.inb[2] <== challenges[6][2];
    tmp_120[0] <== cmul_48.out[0];
    tmp_120[1] <== cmul_48.out[1];
    tmp_120[2] <== cmul_48.out[2];
    signal tmp_121[3];

    tmp_121[0] <== mapValues.tree1_11 - evals[23][0];
    tmp_121[1] <== -evals[23][1];
    tmp_121[2] <== -evals[23][2];
    signal tmp_122[3];

    tmp_122[0] <== tmp_120[0] + tmp_121[0];
    tmp_122[1] <== tmp_120[1] + tmp_121[1];
    tmp_122[2] <== tmp_120[2] + tmp_121[2];
    signal tmp_123[3];

    component cmul_49 = CMul();
    cmul_49.ina[0] <== tmp_122[0];
    cmul_49.ina[1] <== tmp_122[1];
    cmul_49.ina[2] <== tmp_122[2];
    cmul_49.inb[0] <== challenges[6][0];
    cmul_49.inb[1] <== challenges[6][1];
    cmul_49.inb[2] <== challenges[6][2];
    tmp_123[0] <== cmul_49.out[0];
    tmp_123[1] <== cmul_49.out[1];
    tmp_123[2] <== cmul_49.out[2];
    signal tmp_124[3];

    tmp_124[0] <== consts[15] - evals[24][0];
    tmp_124[1] <== -evals[24][1];
    tmp_124[2] <== -evals[24][2];
    signal tmp_125[3];

    tmp_125[0] <== tmp_123[0] + tmp_124[0];
    tmp_125[1] <== tmp_123[1] + tmp_124[1];
    tmp_125[2] <== tmp_123[2] + tmp_124[2];
    signal tmp_126[3];

    component cmul_50 = CMul();
    cmul_50.ina[0] <== tmp_125[0];
    cmul_50.ina[1] <== tmp_125[1];
    cmul_50.ina[2] <== tmp_125[2];
    cmul_50.inb[0] <== challenges[6][0];
    cmul_50.inb[1] <== challenges[6][1];
    cmul_50.inb[2] <== challenges[6][2];
    tmp_126[0] <== cmul_50.out[0];
    tmp_126[1] <== cmul_50.out[1];
    tmp_126[2] <== cmul_50.out[2];
    signal tmp_127[3];

    tmp_127[0] <== consts[0] - evals[26][0];
    tmp_127[1] <== -evals[26][1];
    tmp_127[2] <== -evals[26][2];
    signal tmp_128[3];

    tmp_128[0] <== tmp_126[0] + tmp_127[0];
    tmp_128[1] <== tmp_126[1] + tmp_127[1];
    tmp_128[2] <== tmp_126[2] + tmp_127[2];
    signal tmp_129[3];

    component cmul_51 = CMul();
    cmul_51.ina[0] <== tmp_128[0];
    cmul_51.ina[1] <== tmp_128[1];
    cmul_51.ina[2] <== tmp_128[2];
    cmul_51.inb[0] <== challenges[6][0];
    cmul_51.inb[1] <== challenges[6][1];
    cmul_51.inb[2] <== challenges[6][2];
    tmp_129[0] <== cmul_51.out[0];
    tmp_129[1] <== cmul_51.out[1];
    tmp_129[2] <== cmul_51.out[2];
    signal tmp_130[3];

    tmp_130[0] <== mapValues.tree1_12 - evals[38][0];
    tmp_130[1] <== -evals[38][1];
    tmp_130[2] <== -evals[38][2];
    signal tmp_131[3];

    tmp_131[0] <== tmp_129[0] + tmp_130[0];
    tmp_131[1] <== tmp_129[1] + tmp_130[1];
    tmp_131[2] <== tmp_129[2] + tmp_130[2];
    signal tmp_132[3];

    component cmul_52 = CMul();
    cmul_52.ina[0] <== tmp_131[0];
    cmul_52.ina[1] <== tmp_131[1];
    cmul_52.ina[2] <== tmp_131[2];
    cmul_52.inb[0] <== challenges[6][0];
    cmul_52.inb[1] <== challenges[6][1];
    cmul_52.inb[2] <== challenges[6][2];
    tmp_132[0] <== cmul_52.out[0];
    tmp_132[1] <== cmul_52.out[1];
    tmp_132[2] <== cmul_52.out[2];
    signal tmp_133[3];

    tmp_133[0] <== consts[2] - evals[39][0];
    tmp_133[1] <== -evals[39][1];
    tmp_133[2] <== -evals[39][2];
    signal tmp_134[3];

    tmp_134[0] <== tmp_132[0] + tmp_133[0];
    tmp_134[1] <== tmp_132[1] + tmp_133[1];
    tmp_134[2] <== tmp_132[2] + tmp_133[2];
    signal tmp_135[3];

    component cmul_53 = CMul();
    cmul_53.ina[0] <== tmp_134[0];
    cmul_53.ina[1] <== tmp_134[1];
    cmul_53.ina[2] <== tmp_134[2];
    cmul_53.inb[0] <== challenges[6][0];
    cmul_53.inb[1] <== challenges[6][1];
    cmul_53.inb[2] <== challenges[6][2];
    tmp_135[0] <== cmul_53.out[0];
    tmp_135[1] <== cmul_53.out[1];
    tmp_135[2] <== cmul_53.out[2];
    signal tmp_136[3];

    tmp_136[0] <== mapValues.tree1_13 - evals[40][0];
    tmp_136[1] <== -evals[40][1];
    tmp_136[2] <== -evals[40][2];
    signal tmp_137[3];

    tmp_137[0] <== tmp_135[0] + tmp_136[0];
    tmp_137[1] <== tmp_135[1] + tmp_136[1];
    tmp_137[2] <== tmp_135[2] + tmp_136[2];
    signal tmp_138[3];

    component cmul_54 = CMul();
    cmul_54.ina[0] <== tmp_137[0];
    cmul_54.ina[1] <== tmp_137[1];
    cmul_54.ina[2] <== tmp_137[2];
    cmul_54.inb[0] <== challenges[6][0];
    cmul_54.inb[1] <== challenges[6][1];
    cmul_54.inb[2] <== challenges[6][2];
    tmp_138[0] <== cmul_54.out[0];
    tmp_138[1] <== cmul_54.out[1];
    tmp_138[2] <== cmul_54.out[2];
    signal tmp_139[3];

    tmp_139[0] <== mapValues.tree1_14 - evals[41][0];
    tmp_139[1] <== -evals[41][1];
    tmp_139[2] <== -evals[41][2];
    signal tmp_140[3];

    tmp_140[0] <== tmp_138[0] + tmp_139[0];
    tmp_140[1] <== tmp_138[1] + tmp_139[1];
    tmp_140[2] <== tmp_138[2] + tmp_139[2];
    signal tmp_141[3];

    component cmul_55 = CMul();
    cmul_55.ina[0] <== tmp_140[0];
    cmul_55.ina[1] <== tmp_140[1];
    cmul_55.ina[2] <== tmp_140[2];
    cmul_55.inb[0] <== challenges[6][0];
    cmul_55.inb[1] <== challenges[6][1];
    cmul_55.inb[2] <== challenges[6][2];
    tmp_141[0] <== cmul_55.out[0];
    tmp_141[1] <== cmul_55.out[1];
    tmp_141[2] <== cmul_55.out[2];
    signal tmp_142[3];

    tmp_142[0] <== mapValues.tree1_15 - evals[42][0];
    tmp_142[1] <== -evals[42][1];
    tmp_142[2] <== -evals[42][2];
    signal tmp_143[3];

    tmp_143[0] <== tmp_141[0] + tmp_142[0];
    tmp_143[1] <== tmp_141[1] + tmp_142[1];
    tmp_143[2] <== tmp_141[2] + tmp_142[2];
    signal tmp_144[3];

    component cmul_56 = CMul();
    cmul_56.ina[0] <== tmp_143[0];
    cmul_56.ina[1] <== tmp_143[1];
    cmul_56.ina[2] <== tmp_143[2];
    cmul_56.inb[0] <== challenges[6][0];
    cmul_56.inb[1] <== challenges[6][1];
    cmul_56.inb[2] <== challenges[6][2];
    tmp_144[0] <== cmul_56.out[0];
    tmp_144[1] <== cmul_56.out[1];
    tmp_144[2] <== cmul_56.out[2];
    signal tmp_145[3];

    tmp_145[0] <== mapValues.tree1_16 - evals[47][0];
    tmp_145[1] <== -evals[47][1];
    tmp_145[2] <== -evals[47][2];
    signal tmp_146[3];

    tmp_146[0] <== tmp_144[0] + tmp_145[0];
    tmp_146[1] <== tmp_144[1] + tmp_145[1];
    tmp_146[2] <== tmp_144[2] + tmp_145[2];
    signal tmp_147[3];

    component cmul_57 = CMul();
    cmul_57.ina[0] <== tmp_146[0];
    cmul_57.ina[1] <== tmp_146[1];
    cmul_57.ina[2] <== tmp_146[2];
    cmul_57.inb[0] <== challenges[6][0];
    cmul_57.inb[1] <== challenges[6][1];
    cmul_57.inb[2] <== challenges[6][2];
    tmp_147[0] <== cmul_57.out[0];
    tmp_147[1] <== cmul_57.out[1];
    tmp_147[2] <== cmul_57.out[2];
    signal tmp_148[3];

    tmp_148[0] <== mapValues.tree1_17 - evals[48][0];
    tmp_148[1] <== -evals[48][1];
    tmp_148[2] <== -evals[48][2];
    signal tmp_149[3];

    tmp_149[0] <== tmp_147[0] + tmp_148[0];
    tmp_149[1] <== tmp_147[1] + tmp_148[1];
    tmp_149[2] <== tmp_147[2] + tmp_148[2];
    signal tmp_150[3];

    component cmul_58 = CMul();
    cmul_58.ina[0] <== tmp_149[0];
    cmul_58.ina[1] <== tmp_149[1];
    cmul_58.ina[2] <== tmp_149[2];
    cmul_58.inb[0] <== challenges[6][0];
    cmul_58.inb[1] <== challenges[6][1];
    cmul_58.inb[2] <== challenges[6][2];
    tmp_150[0] <== cmul_58.out[0];
    tmp_150[1] <== cmul_58.out[1];
    tmp_150[2] <== cmul_58.out[2];
    signal tmp_151[3];

    tmp_151[0] <== mapValues.tree1_18 - evals[49][0];
    tmp_151[1] <== -evals[49][1];
    tmp_151[2] <== -evals[49][2];
    signal tmp_152[3];

    tmp_152[0] <== tmp_150[0] + tmp_151[0];
    tmp_152[1] <== tmp_150[1] + tmp_151[1];
    tmp_152[2] <== tmp_150[2] + tmp_151[2];
    signal tmp_153[3];

    component cmul_59 = CMul();
    cmul_59.ina[0] <== tmp_152[0];
    cmul_59.ina[1] <== tmp_152[1];
    cmul_59.ina[2] <== tmp_152[2];
    cmul_59.inb[0] <== challenges[6][0];
    cmul_59.inb[1] <== challenges[6][1];
    cmul_59.inb[2] <== challenges[6][2];
    tmp_153[0] <== cmul_59.out[0];
    tmp_153[1] <== cmul_59.out[1];
    tmp_153[2] <== cmul_59.out[2];
    signal tmp_154[3];

    tmp_154[0] <== consts[1] - evals[50][0];
    tmp_154[1] <== -evals[50][1];
    tmp_154[2] <== -evals[50][2];
    signal tmp_155[3];

    tmp_155[0] <== tmp_153[0] + tmp_154[0];
    tmp_155[1] <== tmp_153[1] + tmp_154[1];
    tmp_155[2] <== tmp_153[2] + tmp_154[2];
    signal tmp_156[3];

    component cmul_60 = CMul();
    cmul_60.ina[0] <== tmp_155[0];
    cmul_60.ina[1] <== tmp_155[1];
    cmul_60.ina[2] <== tmp_155[2];
    cmul_60.inb[0] <== challenges[6][0];
    cmul_60.inb[1] <== challenges[6][1];
    cmul_60.inb[2] <== challenges[6][2];
    tmp_156[0] <== cmul_60.out[0];
    tmp_156[1] <== cmul_60.out[1];
    tmp_156[2] <== cmul_60.out[2];
    signal tmp_157[3];

    tmp_157[0] <== mapValues.tree4_0[0] - evals[51][0];
    tmp_157[1] <== mapValues.tree4_0[1] - evals[51][1];
    tmp_157[2] <== mapValues.tree4_0[2] - evals[51][2];
    signal tmp_158[3];

    tmp_158[0] <== tmp_156[0] + tmp_157[0];
    tmp_158[1] <== tmp_156[1] + tmp_157[1];
    tmp_158[2] <== tmp_156[2] + tmp_157[2];
    signal tmp_159[3];

    component cmul_61 = CMul();
    cmul_61.ina[0] <== tmp_158[0];
    cmul_61.ina[1] <== tmp_158[1];
    cmul_61.ina[2] <== tmp_158[2];
    cmul_61.inb[0] <== challenges[6][0];
    cmul_61.inb[1] <== challenges[6][1];
    cmul_61.inb[2] <== challenges[6][2];
    tmp_159[0] <== cmul_61.out[0];
    tmp_159[1] <== cmul_61.out[1];
    tmp_159[2] <== cmul_61.out[2];
    signal tmp_160[3];

    tmp_160[0] <== mapValues.tree4_1[0] - evals[52][0];
    tmp_160[1] <== mapValues.tree4_1[1] - evals[52][1];
    tmp_160[2] <== mapValues.tree4_1[2] - evals[52][2];
    signal tmp_161[3];

    tmp_161[0] <== tmp_159[0] + tmp_160[0];
    tmp_161[1] <== tmp_159[1] + tmp_160[1];
    tmp_161[2] <== tmp_159[2] + tmp_160[2];
    signal tmp_162[3];

    component cmul_62 = CMul();
    cmul_62.ina[0] <== tmp_161[0];
    cmul_62.ina[1] <== tmp_161[1];
    cmul_62.ina[2] <== tmp_161[2];
    cmul_62.inb[0] <== challenges[6][0];
    cmul_62.inb[1] <== challenges[6][1];
    cmul_62.inb[2] <== challenges[6][2];
    tmp_162[0] <== cmul_62.out[0];
    tmp_162[1] <== cmul_62.out[1];
    tmp_162[2] <== cmul_62.out[2];
    signal tmp_163[3];

    tmp_163[0] <== mapValues.tree4_2[0] - evals[53][0];
    tmp_163[1] <== mapValues.tree4_2[1] - evals[53][1];
    tmp_163[2] <== mapValues.tree4_2[2] - evals[53][2];
    signal tmp_164[3];

    tmp_164[0] <== tmp_162[0] + tmp_163[0];
    tmp_164[1] <== tmp_162[1] + tmp_163[1];
    tmp_164[2] <== tmp_162[2] + tmp_163[2];
    signal tmp_165[3];

    component cmul_63 = CMul();
    cmul_63.ina[0] <== tmp_164[0];
    cmul_63.ina[1] <== tmp_164[1];
    cmul_63.ina[2] <== tmp_164[2];
    cmul_63.inb[0] <== challenges[6][0];
    cmul_63.inb[1] <== challenges[6][1];
    cmul_63.inb[2] <== challenges[6][2];
    tmp_165[0] <== cmul_63.out[0];
    tmp_165[1] <== cmul_63.out[1];
    tmp_165[2] <== cmul_63.out[2];
    signal tmp_166[3];

    tmp_166[0] <== mapValues.tree4_3[0] - evals[54][0];
    tmp_166[1] <== mapValues.tree4_3[1] - evals[54][1];
    tmp_166[2] <== mapValues.tree4_3[2] - evals[54][2];
    signal tmp_167[3];

    tmp_167[0] <== tmp_165[0] + tmp_166[0];
    tmp_167[1] <== tmp_165[1] + tmp_166[1];
    tmp_167[2] <== tmp_165[2] + tmp_166[2];
    signal tmp_168[3];

    component cmul_64 = CMul();
    cmul_64.ina[0] <== tmp_167[0];
    cmul_64.ina[1] <== tmp_167[1];
    cmul_64.ina[2] <== tmp_167[2];
    cmul_64.inb[0] <== challenges[6][0];
    cmul_64.inb[1] <== challenges[6][1];
    cmul_64.inb[2] <== challenges[6][2];
    tmp_168[0] <== cmul_64.out[0];
    tmp_168[1] <== cmul_64.out[1];
    tmp_168[2] <== cmul_64.out[2];
    signal tmp_169[3];

    tmp_169[0] <== mapValues.tree4_4[0] - evals[55][0];
    tmp_169[1] <== mapValues.tree4_4[1] - evals[55][1];
    tmp_169[2] <== mapValues.tree4_4[2] - evals[55][2];
    signal tmp_170[3];

    tmp_170[0] <== tmp_168[0] + tmp_169[0];
    tmp_170[1] <== tmp_168[1] + tmp_169[1];
    tmp_170[2] <== tmp_168[2] + tmp_169[2];
    signal tmp_171[3];

    component cmul_65 = CMul();
    cmul_65.ina[0] <== tmp_170[0];
    cmul_65.ina[1] <== tmp_170[1];
    cmul_65.ina[2] <== tmp_170[2];
    cmul_65.inb[0] <== challenges[6][0];
    cmul_65.inb[1] <== challenges[6][1];
    cmul_65.inb[2] <== challenges[6][2];
    tmp_171[0] <== cmul_65.out[0];
    tmp_171[1] <== cmul_65.out[1];
    tmp_171[2] <== cmul_65.out[2];
    signal tmp_172[3];

    tmp_172[0] <== mapValues.tree4_5[0] - evals[56][0];
    tmp_172[1] <== mapValues.tree4_5[1] - evals[56][1];
    tmp_172[2] <== mapValues.tree4_5[2] - evals[56][2];
    signal tmp_173[3];

    tmp_173[0] <== tmp_171[0] + tmp_172[0];
    tmp_173[1] <== tmp_171[1] + tmp_172[1];
    tmp_173[2] <== tmp_171[2] + tmp_172[2];
    signal tmp_174[3];

    component cmul_66 = CMul();
    cmul_66.ina[0] <== tmp_173[0];
    cmul_66.ina[1] <== tmp_173[1];
    cmul_66.ina[2] <== tmp_173[2];
    cmul_66.inb[0] <== challenges[6][0];
    cmul_66.inb[1] <== challenges[6][1];
    cmul_66.inb[2] <== challenges[6][2];
    tmp_174[0] <== cmul_66.out[0];
    tmp_174[1] <== cmul_66.out[1];
    tmp_174[2] <== cmul_66.out[2];
    signal tmp_175[3];

    tmp_175[0] <== mapValues.tree4_6[0] - evals[57][0];
    tmp_175[1] <== mapValues.tree4_6[1] - evals[57][1];
    tmp_175[2] <== mapValues.tree4_6[2] - evals[57][2];
    signal tmp_176[3];

    tmp_176[0] <== tmp_174[0] + tmp_175[0];
    tmp_176[1] <== tmp_174[1] + tmp_175[1];
    tmp_176[2] <== tmp_174[2] + tmp_175[2];
    signal tmp_177[3];

    component cmul_67 = CMul();
    cmul_67.ina[0] <== tmp_176[0];
    cmul_67.ina[1] <== tmp_176[1];
    cmul_67.ina[2] <== tmp_176[2];
    cmul_67.inb[0] <== challenges[6][0];
    cmul_67.inb[1] <== challenges[6][1];
    cmul_67.inb[2] <== challenges[6][2];
    tmp_177[0] <== cmul_67.out[0];
    tmp_177[1] <== cmul_67.out[1];
    tmp_177[2] <== cmul_67.out[2];
    signal tmp_178[3];

    tmp_178[0] <== mapValues.tree4_7[0] - evals[58][0];
    tmp_178[1] <== mapValues.tree4_7[1] - evals[58][1];
    tmp_178[2] <== mapValues.tree4_7[2] - evals[58][2];
    signal tmp_179[3];

    tmp_179[0] <== tmp_177[0] + tmp_178[0];
    tmp_179[1] <== tmp_177[1] + tmp_178[1];
    tmp_179[2] <== tmp_177[2] + tmp_178[2];
    signal tmp_180[3];

    component cmul_68 = CMul();
    cmul_68.ina[0] <== tmp_179[0];
    cmul_68.ina[1] <== tmp_179[1];
    cmul_68.ina[2] <== tmp_179[2];
    cmul_68.inb[0] <== xDivXSubXi[0];
    cmul_68.inb[1] <== xDivXSubXi[1];
    cmul_68.inb[2] <== xDivXSubXi[2];
    tmp_180[0] <== cmul_68.out[0];
    tmp_180[1] <== cmul_68.out[1];
    tmp_180[2] <== cmul_68.out[2];
    signal tmp_181[3];

    tmp_181[0] <== tmp_52[0] + tmp_180[0];
    tmp_181[1] <== tmp_52[1] + tmp_180[1];
    tmp_181[2] <== tmp_52[2] + tmp_180[2];
    signal tmp_182[3];

    component cmul_69 = CMul();
    cmul_69.ina[0] <== challenges[5][0];
    cmul_69.ina[1] <== challenges[5][1];
    cmul_69.ina[2] <== challenges[5][2];
    cmul_69.inb[0] <== tmp_181[0];
    cmul_69.inb[1] <== tmp_181[1];
    cmul_69.inb[2] <== tmp_181[2];
    tmp_182[0] <== cmul_69.out[0];
    tmp_182[1] <== cmul_69.out[1];
    tmp_182[2] <== cmul_69.out[2];
    signal tmp_183[3];

    tmp_183[0] <== mapValues.tree1_0 - evals[25][0];
    tmp_183[1] <== -evals[25][1];
    tmp_183[2] <== -evals[25][2];
    signal tmp_184[3];

    component cmul_70 = CMul();
    cmul_70.ina[0] <== tmp_183[0];
    cmul_70.ina[1] <== tmp_183[1];
    cmul_70.ina[2] <== tmp_183[2];
    cmul_70.inb[0] <== challenges[6][0];
    cmul_70.inb[1] <== challenges[6][1];
    cmul_70.inb[2] <== challenges[6][2];
    tmp_184[0] <== cmul_70.out[0];
    tmp_184[1] <== cmul_70.out[1];
    tmp_184[2] <== cmul_70.out[2];
    signal tmp_185[3];

    tmp_185[0] <== mapValues.tree1_1 - evals[27][0];
    tmp_185[1] <== -evals[27][1];
    tmp_185[2] <== -evals[27][2];
    signal tmp_186[3];

    tmp_186[0] <== tmp_184[0] + tmp_185[0];
    tmp_186[1] <== tmp_184[1] + tmp_185[1];
    tmp_186[2] <== tmp_184[2] + tmp_185[2];
    signal tmp_187[3];

    component cmul_71 = CMul();
    cmul_71.ina[0] <== tmp_186[0];
    cmul_71.ina[1] <== tmp_186[1];
    cmul_71.ina[2] <== tmp_186[2];
    cmul_71.inb[0] <== challenges[6][0];
    cmul_71.inb[1] <== challenges[6][1];
    cmul_71.inb[2] <== challenges[6][2];
    tmp_187[0] <== cmul_71.out[0];
    tmp_187[1] <== cmul_71.out[1];
    tmp_187[2] <== cmul_71.out[2];
    signal tmp_188[3];

    tmp_188[0] <== mapValues.tree1_2 - evals[28][0];
    tmp_188[1] <== -evals[28][1];
    tmp_188[2] <== -evals[28][2];
    signal tmp_189[3];

    tmp_189[0] <== tmp_187[0] + tmp_188[0];
    tmp_189[1] <== tmp_187[1] + tmp_188[1];
    tmp_189[2] <== tmp_187[2] + tmp_188[2];
    signal tmp_190[3];

    component cmul_72 = CMul();
    cmul_72.ina[0] <== tmp_189[0];
    cmul_72.ina[1] <== tmp_189[1];
    cmul_72.ina[2] <== tmp_189[2];
    cmul_72.inb[0] <== challenges[6][0];
    cmul_72.inb[1] <== challenges[6][1];
    cmul_72.inb[2] <== challenges[6][2];
    tmp_190[0] <== cmul_72.out[0];
    tmp_190[1] <== cmul_72.out[1];
    tmp_190[2] <== cmul_72.out[2];
    signal tmp_191[3];

    tmp_191[0] <== mapValues.tree1_3 - evals[29][0];
    tmp_191[1] <== -evals[29][1];
    tmp_191[2] <== -evals[29][2];
    signal tmp_192[3];

    tmp_192[0] <== tmp_190[0] + tmp_191[0];
    tmp_192[1] <== tmp_190[1] + tmp_191[1];
    tmp_192[2] <== tmp_190[2] + tmp_191[2];
    signal tmp_193[3];

    component cmul_73 = CMul();
    cmul_73.ina[0] <== tmp_192[0];
    cmul_73.ina[1] <== tmp_192[1];
    cmul_73.ina[2] <== tmp_192[2];
    cmul_73.inb[0] <== challenges[6][0];
    cmul_73.inb[1] <== challenges[6][1];
    cmul_73.inb[2] <== challenges[6][2];
    tmp_193[0] <== cmul_73.out[0];
    tmp_193[1] <== cmul_73.out[1];
    tmp_193[2] <== cmul_73.out[2];
    signal tmp_194[3];

    tmp_194[0] <== mapValues.tree1_4 - evals[30][0];
    tmp_194[1] <== -evals[30][1];
    tmp_194[2] <== -evals[30][2];
    signal tmp_195[3];

    tmp_195[0] <== tmp_193[0] + tmp_194[0];
    tmp_195[1] <== tmp_193[1] + tmp_194[1];
    tmp_195[2] <== tmp_193[2] + tmp_194[2];
    signal tmp_196[3];

    component cmul_74 = CMul();
    cmul_74.ina[0] <== tmp_195[0];
    cmul_74.ina[1] <== tmp_195[1];
    cmul_74.ina[2] <== tmp_195[2];
    cmul_74.inb[0] <== challenges[6][0];
    cmul_74.inb[1] <== challenges[6][1];
    cmul_74.inb[2] <== challenges[6][2];
    tmp_196[0] <== cmul_74.out[0];
    tmp_196[1] <== cmul_74.out[1];
    tmp_196[2] <== cmul_74.out[2];
    signal tmp_197[3];

    tmp_197[0] <== mapValues.tree1_5 - evals[31][0];
    tmp_197[1] <== -evals[31][1];
    tmp_197[2] <== -evals[31][2];
    signal tmp_198[3];

    tmp_198[0] <== tmp_196[0] + tmp_197[0];
    tmp_198[1] <== tmp_196[1] + tmp_197[1];
    tmp_198[2] <== tmp_196[2] + tmp_197[2];
    signal tmp_199[3];

    component cmul_75 = CMul();
    cmul_75.ina[0] <== tmp_198[0];
    cmul_75.ina[1] <== tmp_198[1];
    cmul_75.ina[2] <== tmp_198[2];
    cmul_75.inb[0] <== challenges[6][0];
    cmul_75.inb[1] <== challenges[6][1];
    cmul_75.inb[2] <== challenges[6][2];
    tmp_199[0] <== cmul_75.out[0];
    tmp_199[1] <== cmul_75.out[1];
    tmp_199[2] <== cmul_75.out[2];
    signal tmp_200[3];

    tmp_200[0] <== mapValues.tree1_6 - evals[32][0];
    tmp_200[1] <== -evals[32][1];
    tmp_200[2] <== -evals[32][2];
    signal tmp_201[3];

    tmp_201[0] <== tmp_199[0] + tmp_200[0];
    tmp_201[1] <== tmp_199[1] + tmp_200[1];
    tmp_201[2] <== tmp_199[2] + tmp_200[2];
    signal tmp_202[3];

    component cmul_76 = CMul();
    cmul_76.ina[0] <== tmp_201[0];
    cmul_76.ina[1] <== tmp_201[1];
    cmul_76.ina[2] <== tmp_201[2];
    cmul_76.inb[0] <== challenges[6][0];
    cmul_76.inb[1] <== challenges[6][1];
    cmul_76.inb[2] <== challenges[6][2];
    tmp_202[0] <== cmul_76.out[0];
    tmp_202[1] <== cmul_76.out[1];
    tmp_202[2] <== cmul_76.out[2];
    signal tmp_203[3];

    tmp_203[0] <== mapValues.tree1_7 - evals[33][0];
    tmp_203[1] <== -evals[33][1];
    tmp_203[2] <== -evals[33][2];
    signal tmp_204[3];

    tmp_204[0] <== tmp_202[0] + tmp_203[0];
    tmp_204[1] <== tmp_202[1] + tmp_203[1];
    tmp_204[2] <== tmp_202[2] + tmp_203[2];
    signal tmp_205[3];

    component cmul_77 = CMul();
    cmul_77.ina[0] <== tmp_204[0];
    cmul_77.ina[1] <== tmp_204[1];
    cmul_77.ina[2] <== tmp_204[2];
    cmul_77.inb[0] <== challenges[6][0];
    cmul_77.inb[1] <== challenges[6][1];
    cmul_77.inb[2] <== challenges[6][2];
    tmp_205[0] <== cmul_77.out[0];
    tmp_205[1] <== cmul_77.out[1];
    tmp_205[2] <== cmul_77.out[2];
    signal tmp_206[3];

    tmp_206[0] <== mapValues.tree1_8 - evals[34][0];
    tmp_206[1] <== -evals[34][1];
    tmp_206[2] <== -evals[34][2];
    signal tmp_207[3];

    tmp_207[0] <== tmp_205[0] + tmp_206[0];
    tmp_207[1] <== tmp_205[1] + tmp_206[1];
    tmp_207[2] <== tmp_205[2] + tmp_206[2];
    signal tmp_208[3];

    component cmul_78 = CMul();
    cmul_78.ina[0] <== tmp_207[0];
    cmul_78.ina[1] <== tmp_207[1];
    cmul_78.ina[2] <== tmp_207[2];
    cmul_78.inb[0] <== challenges[6][0];
    cmul_78.inb[1] <== challenges[6][1];
    cmul_78.inb[2] <== challenges[6][2];
    tmp_208[0] <== cmul_78.out[0];
    tmp_208[1] <== cmul_78.out[1];
    tmp_208[2] <== cmul_78.out[2];
    signal tmp_209[3];

    tmp_209[0] <== mapValues.tree1_9 - evals[35][0];
    tmp_209[1] <== -evals[35][1];
    tmp_209[2] <== -evals[35][2];
    signal tmp_210[3];

    tmp_210[0] <== tmp_208[0] + tmp_209[0];
    tmp_210[1] <== tmp_208[1] + tmp_209[1];
    tmp_210[2] <== tmp_208[2] + tmp_209[2];
    signal tmp_211[3];

    component cmul_79 = CMul();
    cmul_79.ina[0] <== tmp_210[0];
    cmul_79.ina[1] <== tmp_210[1];
    cmul_79.ina[2] <== tmp_210[2];
    cmul_79.inb[0] <== challenges[6][0];
    cmul_79.inb[1] <== challenges[6][1];
    cmul_79.inb[2] <== challenges[6][2];
    tmp_211[0] <== cmul_79.out[0];
    tmp_211[1] <== cmul_79.out[1];
    tmp_211[2] <== cmul_79.out[2];
    signal tmp_212[3];

    tmp_212[0] <== mapValues.tree1_10 - evals[36][0];
    tmp_212[1] <== -evals[36][1];
    tmp_212[2] <== -evals[36][2];
    signal tmp_213[3];

    tmp_213[0] <== tmp_211[0] + tmp_212[0];
    tmp_213[1] <== tmp_211[1] + tmp_212[1];
    tmp_213[2] <== tmp_211[2] + tmp_212[2];
    signal tmp_214[3];

    component cmul_80 = CMul();
    cmul_80.ina[0] <== tmp_213[0];
    cmul_80.ina[1] <== tmp_213[1];
    cmul_80.ina[2] <== tmp_213[2];
    cmul_80.inb[0] <== challenges[6][0];
    cmul_80.inb[1] <== challenges[6][1];
    cmul_80.inb[2] <== challenges[6][2];
    tmp_214[0] <== cmul_80.out[0];
    tmp_214[1] <== cmul_80.out[1];
    tmp_214[2] <== cmul_80.out[2];
    signal tmp_215[3];

    tmp_215[0] <== mapValues.tree1_11 - evals[37][0];
    tmp_215[1] <== -evals[37][1];
    tmp_215[2] <== -evals[37][2];
    signal tmp_216[3];

    tmp_216[0] <== tmp_214[0] + tmp_215[0];
    tmp_216[1] <== tmp_214[1] + tmp_215[1];
    tmp_216[2] <== tmp_214[2] + tmp_215[2];
    signal tmp_217[3];

    component cmul_81 = CMul();
    cmul_81.ina[0] <== tmp_216[0];
    cmul_81.ina[1] <== tmp_216[1];
    cmul_81.ina[2] <== tmp_216[2];
    cmul_81.inb[0] <== challenges[6][0];
    cmul_81.inb[1] <== challenges[6][1];
    cmul_81.inb[2] <== challenges[6][2];
    tmp_217[0] <== cmul_81.out[0];
    tmp_217[1] <== cmul_81.out[1];
    tmp_217[2] <== cmul_81.out[2];
    signal tmp_218[3];

    tmp_218[0] <== mapValues.tree1_12 - evals[43][0];
    tmp_218[1] <== -evals[43][1];
    tmp_218[2] <== -evals[43][2];
    signal tmp_219[3];

    tmp_219[0] <== tmp_217[0] + tmp_218[0];
    tmp_219[1] <== tmp_217[1] + tmp_218[1];
    tmp_219[2] <== tmp_217[2] + tmp_218[2];
    signal tmp_220[3];

    component cmul_82 = CMul();
    cmul_82.ina[0] <== tmp_219[0];
    cmul_82.ina[1] <== tmp_219[1];
    cmul_82.ina[2] <== tmp_219[2];
    cmul_82.inb[0] <== challenges[6][0];
    cmul_82.inb[1] <== challenges[6][1];
    cmul_82.inb[2] <== challenges[6][2];
    tmp_220[0] <== cmul_82.out[0];
    tmp_220[1] <== cmul_82.out[1];
    tmp_220[2] <== cmul_82.out[2];
    signal tmp_221[3];

    tmp_221[0] <== mapValues.tree1_13 - evals[44][0];
    tmp_221[1] <== -evals[44][1];
    tmp_221[2] <== -evals[44][2];
    signal tmp_222[3];

    tmp_222[0] <== tmp_220[0] + tmp_221[0];
    tmp_222[1] <== tmp_220[1] + tmp_221[1];
    tmp_222[2] <== tmp_220[2] + tmp_221[2];
    signal tmp_223[3];

    component cmul_83 = CMul();
    cmul_83.ina[0] <== tmp_222[0];
    cmul_83.ina[1] <== tmp_222[1];
    cmul_83.ina[2] <== tmp_222[2];
    cmul_83.inb[0] <== challenges[6][0];
    cmul_83.inb[1] <== challenges[6][1];
    cmul_83.inb[2] <== challenges[6][2];
    tmp_223[0] <== cmul_83.out[0];
    tmp_223[1] <== cmul_83.out[1];
    tmp_223[2] <== cmul_83.out[2];
    signal tmp_224[3];

    tmp_224[0] <== mapValues.tree1_14 - evals[45][0];
    tmp_224[1] <== -evals[45][1];
    tmp_224[2] <== -evals[45][2];
    signal tmp_225[3];

    tmp_225[0] <== tmp_223[0] + tmp_224[0];
    tmp_225[1] <== tmp_223[1] + tmp_224[1];
    tmp_225[2] <== tmp_223[2] + tmp_224[2];
    signal tmp_226[3];

    component cmul_84 = CMul();
    cmul_84.ina[0] <== tmp_225[0];
    cmul_84.ina[1] <== tmp_225[1];
    cmul_84.ina[2] <== tmp_225[2];
    cmul_84.inb[0] <== challenges[6][0];
    cmul_84.inb[1] <== challenges[6][1];
    cmul_84.inb[2] <== challenges[6][2];
    tmp_226[0] <== cmul_84.out[0];
    tmp_226[1] <== cmul_84.out[1];
    tmp_226[2] <== cmul_84.out[2];
    signal tmp_227[3];

    tmp_227[0] <== mapValues.tree1_15 - evals[46][0];
    tmp_227[1] <== -evals[46][1];
    tmp_227[2] <== -evals[46][2];
    signal tmp_228[3];

    tmp_228[0] <== tmp_226[0] + tmp_227[0];
    tmp_228[1] <== tmp_226[1] + tmp_227[1];
    tmp_228[2] <== tmp_226[2] + tmp_227[2];
    signal tmp_229[3];

    component cmul_85 = CMul();
    cmul_85.ina[0] <== tmp_228[0];
    cmul_85.ina[1] <== tmp_228[1];
    cmul_85.ina[2] <== tmp_228[2];
    cmul_85.inb[0] <== xDivXSubWXi[0];
    cmul_85.inb[1] <== xDivXSubWXi[1];
    cmul_85.inb[2] <== xDivXSubWXi[2];
    tmp_229[0] <== cmul_85.out[0];
    tmp_229[1] <== cmul_85.out[1];
    tmp_229[2] <== cmul_85.out[2];
    signal tmp_230[3];

    tmp_230[0] <== tmp_182[0] + tmp_229[0];
    tmp_230[1] <== tmp_182[1] + tmp_229[1];
    tmp_230[2] <== tmp_182[2] + tmp_229[2];

    out[0] <== tmp_230[0];
    out[1] <== tmp_230[1];
    out[2] <== tmp_230[2];
}


template MapValues() {
    signal input vals1[19];
    signal input vals4[24];

    signal output tree1_0;
    signal output tree1_1;
    signal output tree1_2;
    signal output tree1_3;
    signal output tree1_4;
    signal output tree1_5;
    signal output tree1_6;
    signal output tree1_7;
    signal output tree1_8;
    signal output tree1_9;
    signal output tree1_10;
    signal output tree1_11;
    signal output tree1_12;
    signal output tree1_13;
    signal output tree1_14;
    signal output tree1_15;
    signal output tree1_16;
    signal output tree1_17;
    signal output tree1_18;
    signal output tree4_0[3];
    signal output tree4_1[3];
    signal output tree4_2[3];
    signal output tree4_3[3];
    signal output tree4_4[3];
    signal output tree4_5[3];
    signal output tree4_6[3];
    signal output tree4_7[3];

    tree1_0 <== vals1[0];
    tree1_1 <== vals1[1];
    tree1_2 <== vals1[2];
    tree1_3 <== vals1[3];
    tree1_4 <== vals1[4];
    tree1_5 <== vals1[5];
    tree1_6 <== vals1[6];
    tree1_7 <== vals1[7];
    tree1_8 <== vals1[8];
    tree1_9 <== vals1[9];
    tree1_10 <== vals1[10];
    tree1_11 <== vals1[11];
    tree1_12 <== vals1[12];
    tree1_13 <== vals1[13];
    tree1_14 <== vals1[14];
    tree1_15 <== vals1[15];
    tree1_16 <== vals1[16];
    tree1_17 <== vals1[17];
    tree1_18 <== vals1[18];
    tree4_0[0] <== vals4[0];
    tree4_0[1] <== vals4[1];
    tree4_0[2] <== vals4[2];
    tree4_1[0] <== vals4[3];
    tree4_1[1] <== vals4[4];
    tree4_1[2] <== vals4[5];
    tree4_2[0] <== vals4[6];
    tree4_2[1] <== vals4[7];
    tree4_2[2] <== vals4[8];
    tree4_3[0] <== vals4[9];
    tree4_3[1] <== vals4[10];
    tree4_3[2] <== vals4[11];
    tree4_4[0] <== vals4[12];
    tree4_4[1] <== vals4[13];
    tree4_4[2] <== vals4[14];
    tree4_5[0] <== vals4[15];
    tree4_5[1] <== vals4[16];
    tree4_5[2] <== vals4[17];
    tree4_6[0] <== vals4[18];
    tree4_6[1] <== vals4[19];
    tree4_6[2] <== vals4[20];
    tree4_7[0] <== vals4[21];
    tree4_7[1] <== vals4[22];
    tree4_7[2] <== vals4[23];
}


template StarkVerifier() {
    signal input publics[0];
    signal input root1[4];
    signal input root2[4];
    signal input root3[4];
    signal input root4[4];

    signal rootC[4];
    rootC[0] <== 9933353322016137535;
    rootC[1] <== 1828687904825320615;
    rootC[2] <== 9049892441320016656;
    rootC[3] <== 16392326386865693955;


    signal input evals[59][3];

    signal input s0_vals1[8][19];
    signal input s0_vals4[8][24];
    signal input s0_valsC[8][16];
    signal input s0_siblings1[8][11][4];
    signal input s0_siblings4[8][11][4];
    signal input s0_siblingsC[8][11][4];

    signal input s1_root[4];
    signal input s2_root[4];

    signal input s1_vals[8][48];
    signal input s1_siblings[8][7][4];
    signal input s2_vals[8][48];
    signal input s2_siblings[8][3][4];

    signal input finalPol[8][3];

    signal enable;
    enable <== 1;


    signal challenges[8][3];
    signal s0_specialX[3];
    signal s1_specialX[3];
    signal s2_specialX[3];

    signal ys[8][11];


///////////
// challenge calculation
///////////


    component tcHahs_0 = Poseidon(12);
    tcHahs_0.in[0] <== root1[0];
    tcHahs_0.in[1] <== root1[1];
    tcHahs_0.in[2] <== root1[2];
    tcHahs_0.in[3] <== root1[3];
    tcHahs_0.in[4] <== 0;
    tcHahs_0.in[5] <== 0;
    tcHahs_0.in[6] <== 0;
    tcHahs_0.in[7] <== 0;
    tcHahs_0.capacity[0] <== 0;
    tcHahs_0.capacity[1] <== 0;
    tcHahs_0.capacity[2] <== 0;
    tcHahs_0.capacity[3] <== 0;
    challenges[0][0] <== tcHahs_0.out[0];
    challenges[0][1] <== tcHahs_0.out[1];
    challenges[0][2] <== tcHahs_0.out[2];
    challenges[1][0] <== tcHahs_0.out[3];
    challenges[1][1] <== tcHahs_0.out[4];
    challenges[1][2] <== tcHahs_0.out[5];
    component tcHahs_1 = Poseidon(12);
    tcHahs_1.in[0] <== root2[0];
    tcHahs_1.in[1] <== root2[1];
    tcHahs_1.in[2] <== root2[2];
    tcHahs_1.in[3] <== root2[3];
    tcHahs_1.in[4] <== 0;
    tcHahs_1.in[5] <== 0;
    tcHahs_1.in[6] <== 0;
    tcHahs_1.in[7] <== 0;
    tcHahs_1.capacity[0] <== tcHahs_0.out[0];
    tcHahs_1.capacity[1] <== tcHahs_0.out[1];
    tcHahs_1.capacity[2] <== tcHahs_0.out[2];
    tcHahs_1.capacity[3] <== tcHahs_0.out[3];
    challenges[2][0] <== tcHahs_1.out[0];
    challenges[2][1] <== tcHahs_1.out[1];
    challenges[2][2] <== tcHahs_1.out[2];
    challenges[3][0] <== tcHahs_1.out[3];
    challenges[3][1] <== tcHahs_1.out[4];
    challenges[3][2] <== tcHahs_1.out[5];
    component tcHahs_2 = Poseidon(12);
    tcHahs_2.in[0] <== root3[0];
    tcHahs_2.in[1] <== root3[1];
    tcHahs_2.in[2] <== root3[2];
    tcHahs_2.in[3] <== root3[3];
    tcHahs_2.in[4] <== 0;
    tcHahs_2.in[5] <== 0;
    tcHahs_2.in[6] <== 0;
    tcHahs_2.in[7] <== 0;
    tcHahs_2.capacity[0] <== tcHahs_1.out[0];
    tcHahs_2.capacity[1] <== tcHahs_1.out[1];
    tcHahs_2.capacity[2] <== tcHahs_1.out[2];
    tcHahs_2.capacity[3] <== tcHahs_1.out[3];
    challenges[4][0] <== tcHahs_2.out[0];
    challenges[4][1] <== tcHahs_2.out[1];
    challenges[4][2] <== tcHahs_2.out[2];
    component tcHahs_3 = Poseidon(12);
    tcHahs_3.in[0] <== root4[0];
    tcHahs_3.in[1] <== root4[1];
    tcHahs_3.in[2] <== root4[2];
    tcHahs_3.in[3] <== root4[3];
    tcHahs_3.in[4] <== 0;
    tcHahs_3.in[5] <== 0;
    tcHahs_3.in[6] <== 0;
    tcHahs_3.in[7] <== 0;
    tcHahs_3.capacity[0] <== tcHahs_2.out[0];
    tcHahs_3.capacity[1] <== tcHahs_2.out[1];
    tcHahs_3.capacity[2] <== tcHahs_2.out[2];
    tcHahs_3.capacity[3] <== tcHahs_2.out[3];
    challenges[7][0] <== tcHahs_3.out[0];
    challenges[7][1] <== tcHahs_3.out[1];
    challenges[7][2] <== tcHahs_3.out[2];
    component tcHahs_4 = Poseidon(12);
    tcHahs_4.in[0] <== evals[0][0];
    tcHahs_4.in[1] <== evals[0][1];
    tcHahs_4.in[2] <== evals[0][2];
    tcHahs_4.in[3] <== evals[1][0];
    tcHahs_4.in[4] <== evals[1][1];
    tcHahs_4.in[5] <== evals[1][2];
    tcHahs_4.in[6] <== evals[2][0];
    tcHahs_4.in[7] <== evals[2][1];
    tcHahs_4.capacity[0] <== tcHahs_3.out[0];
    tcHahs_4.capacity[1] <== tcHahs_3.out[1];
    tcHahs_4.capacity[2] <== tcHahs_3.out[2];
    tcHahs_4.capacity[3] <== tcHahs_3.out[3];
    component tcHahs_5 = Poseidon(12);
    tcHahs_5.in[0] <== evals[2][2];
    tcHahs_5.in[1] <== evals[3][0];
    tcHahs_5.in[2] <== evals[3][1];
    tcHahs_5.in[3] <== evals[3][2];
    tcHahs_5.in[4] <== evals[4][0];
    tcHahs_5.in[5] <== evals[4][1];
    tcHahs_5.in[6] <== evals[4][2];
    tcHahs_5.in[7] <== evals[5][0];
    tcHahs_5.capacity[0] <== tcHahs_4.out[0];
    tcHahs_5.capacity[1] <== tcHahs_4.out[1];
    tcHahs_5.capacity[2] <== tcHahs_4.out[2];
    tcHahs_5.capacity[3] <== tcHahs_4.out[3];
    component tcHahs_6 = Poseidon(12);
    tcHahs_6.in[0] <== evals[5][1];
    tcHahs_6.in[1] <== evals[5][2];
    tcHahs_6.in[2] <== evals[6][0];
    tcHahs_6.in[3] <== evals[6][1];
    tcHahs_6.in[4] <== evals[6][2];
    tcHahs_6.in[5] <== evals[7][0];
    tcHahs_6.in[6] <== evals[7][1];
    tcHahs_6.in[7] <== evals[7][2];
    tcHahs_6.capacity[0] <== tcHahs_5.out[0];
    tcHahs_6.capacity[1] <== tcHahs_5.out[1];
    tcHahs_6.capacity[2] <== tcHahs_5.out[2];
    tcHahs_6.capacity[3] <== tcHahs_5.out[3];
    component tcHahs_7 = Poseidon(12);
    tcHahs_7.in[0] <== evals[8][0];
    tcHahs_7.in[1] <== evals[8][1];
    tcHahs_7.in[2] <== evals[8][2];
    tcHahs_7.in[3] <== evals[9][0];
    tcHahs_7.in[4] <== evals[9][1];
    tcHahs_7.in[5] <== evals[9][2];
    tcHahs_7.in[6] <== evals[10][0];
    tcHahs_7.in[7] <== evals[10][1];
    tcHahs_7.capacity[0] <== tcHahs_6.out[0];
    tcHahs_7.capacity[1] <== tcHahs_6.out[1];
    tcHahs_7.capacity[2] <== tcHahs_6.out[2];
    tcHahs_7.capacity[3] <== tcHahs_6.out[3];
    component tcHahs_8 = Poseidon(12);
    tcHahs_8.in[0] <== evals[10][2];
    tcHahs_8.in[1] <== evals[11][0];
    tcHahs_8.in[2] <== evals[11][1];
    tcHahs_8.in[3] <== evals[11][2];
    tcHahs_8.in[4] <== evals[12][0];
    tcHahs_8.in[5] <== evals[12][1];
    tcHahs_8.in[6] <== evals[12][2];
    tcHahs_8.in[7] <== evals[13][0];
    tcHahs_8.capacity[0] <== tcHahs_7.out[0];
    tcHahs_8.capacity[1] <== tcHahs_7.out[1];
    tcHahs_8.capacity[2] <== tcHahs_7.out[2];
    tcHahs_8.capacity[3] <== tcHahs_7.out[3];
    component tcHahs_9 = Poseidon(12);
    tcHahs_9.in[0] <== evals[13][1];
    tcHahs_9.in[1] <== evals[13][2];
    tcHahs_9.in[2] <== evals[14][0];
    tcHahs_9.in[3] <== evals[14][1];
    tcHahs_9.in[4] <== evals[14][2];
    tcHahs_9.in[5] <== evals[15][0];
    tcHahs_9.in[6] <== evals[15][1];
    tcHahs_9.in[7] <== evals[15][2];
    tcHahs_9.capacity[0] <== tcHahs_8.out[0];
    tcHahs_9.capacity[1] <== tcHahs_8.out[1];
    tcHahs_9.capacity[2] <== tcHahs_8.out[2];
    tcHahs_9.capacity[3] <== tcHahs_8.out[3];
    component tcHahs_10 = Poseidon(12);
    tcHahs_10.in[0] <== evals[16][0];
    tcHahs_10.in[1] <== evals[16][1];
    tcHahs_10.in[2] <== evals[16][2];
    tcHahs_10.in[3] <== evals[17][0];
    tcHahs_10.in[4] <== evals[17][1];
    tcHahs_10.in[5] <== evals[17][2];
    tcHahs_10.in[6] <== evals[18][0];
    tcHahs_10.in[7] <== evals[18][1];
    tcHahs_10.capacity[0] <== tcHahs_9.out[0];
    tcHahs_10.capacity[1] <== tcHahs_9.out[1];
    tcHahs_10.capacity[2] <== tcHahs_9.out[2];
    tcHahs_10.capacity[3] <== tcHahs_9.out[3];
    component tcHahs_11 = Poseidon(12);
    tcHahs_11.in[0] <== evals[18][2];
    tcHahs_11.in[1] <== evals[19][0];
    tcHahs_11.in[2] <== evals[19][1];
    tcHahs_11.in[3] <== evals[19][2];
    tcHahs_11.in[4] <== evals[20][0];
    tcHahs_11.in[5] <== evals[20][1];
    tcHahs_11.in[6] <== evals[20][2];
    tcHahs_11.in[7] <== evals[21][0];
    tcHahs_11.capacity[0] <== tcHahs_10.out[0];
    tcHahs_11.capacity[1] <== tcHahs_10.out[1];
    tcHahs_11.capacity[2] <== tcHahs_10.out[2];
    tcHahs_11.capacity[3] <== tcHahs_10.out[3];
    component tcHahs_12 = Poseidon(12);
    tcHahs_12.in[0] <== evals[21][1];
    tcHahs_12.in[1] <== evals[21][2];
    tcHahs_12.in[2] <== evals[22][0];
    tcHahs_12.in[3] <== evals[22][1];
    tcHahs_12.in[4] <== evals[22][2];
    tcHahs_12.in[5] <== evals[23][0];
    tcHahs_12.in[6] <== evals[23][1];
    tcHahs_12.in[7] <== evals[23][2];
    tcHahs_12.capacity[0] <== tcHahs_11.out[0];
    tcHahs_12.capacity[1] <== tcHahs_11.out[1];
    tcHahs_12.capacity[2] <== tcHahs_11.out[2];
    tcHahs_12.capacity[3] <== tcHahs_11.out[3];
    component tcHahs_13 = Poseidon(12);
    tcHahs_13.in[0] <== evals[24][0];
    tcHahs_13.in[1] <== evals[24][1];
    tcHahs_13.in[2] <== evals[24][2];
    tcHahs_13.in[3] <== evals[25][0];
    tcHahs_13.in[4] <== evals[25][1];
    tcHahs_13.in[5] <== evals[25][2];
    tcHahs_13.in[6] <== evals[26][0];
    tcHahs_13.in[7] <== evals[26][1];
    tcHahs_13.capacity[0] <== tcHahs_12.out[0];
    tcHahs_13.capacity[1] <== tcHahs_12.out[1];
    tcHahs_13.capacity[2] <== tcHahs_12.out[2];
    tcHahs_13.capacity[3] <== tcHahs_12.out[3];
    component tcHahs_14 = Poseidon(12);
    tcHahs_14.in[0] <== evals[26][2];
    tcHahs_14.in[1] <== evals[27][0];
    tcHahs_14.in[2] <== evals[27][1];
    tcHahs_14.in[3] <== evals[27][2];
    tcHahs_14.in[4] <== evals[28][0];
    tcHahs_14.in[5] <== evals[28][1];
    tcHahs_14.in[6] <== evals[28][2];
    tcHahs_14.in[7] <== evals[29][0];
    tcHahs_14.capacity[0] <== tcHahs_13.out[0];
    tcHahs_14.capacity[1] <== tcHahs_13.out[1];
    tcHahs_14.capacity[2] <== tcHahs_13.out[2];
    tcHahs_14.capacity[3] <== tcHahs_13.out[3];
    component tcHahs_15 = Poseidon(12);
    tcHahs_15.in[0] <== evals[29][1];
    tcHahs_15.in[1] <== evals[29][2];
    tcHahs_15.in[2] <== evals[30][0];
    tcHahs_15.in[3] <== evals[30][1];
    tcHahs_15.in[4] <== evals[30][2];
    tcHahs_15.in[5] <== evals[31][0];
    tcHahs_15.in[6] <== evals[31][1];
    tcHahs_15.in[7] <== evals[31][2];
    tcHahs_15.capacity[0] <== tcHahs_14.out[0];
    tcHahs_15.capacity[1] <== tcHahs_14.out[1];
    tcHahs_15.capacity[2] <== tcHahs_14.out[2];
    tcHahs_15.capacity[3] <== tcHahs_14.out[3];
    component tcHahs_16 = Poseidon(12);
    tcHahs_16.in[0] <== evals[32][0];
    tcHahs_16.in[1] <== evals[32][1];
    tcHahs_16.in[2] <== evals[32][2];
    tcHahs_16.in[3] <== evals[33][0];
    tcHahs_16.in[4] <== evals[33][1];
    tcHahs_16.in[5] <== evals[33][2];
    tcHahs_16.in[6] <== evals[34][0];
    tcHahs_16.in[7] <== evals[34][1];
    tcHahs_16.capacity[0] <== tcHahs_15.out[0];
    tcHahs_16.capacity[1] <== tcHahs_15.out[1];
    tcHahs_16.capacity[2] <== tcHahs_15.out[2];
    tcHahs_16.capacity[3] <== tcHahs_15.out[3];
    component tcHahs_17 = Poseidon(12);
    tcHahs_17.in[0] <== evals[34][2];
    tcHahs_17.in[1] <== evals[35][0];
    tcHahs_17.in[2] <== evals[35][1];
    tcHahs_17.in[3] <== evals[35][2];
    tcHahs_17.in[4] <== evals[36][0];
    tcHahs_17.in[5] <== evals[36][1];
    tcHahs_17.in[6] <== evals[36][2];
    tcHahs_17.in[7] <== evals[37][0];
    tcHahs_17.capacity[0] <== tcHahs_16.out[0];
    tcHahs_17.capacity[1] <== tcHahs_16.out[1];
    tcHahs_17.capacity[2] <== tcHahs_16.out[2];
    tcHahs_17.capacity[3] <== tcHahs_16.out[3];
    component tcHahs_18 = Poseidon(12);
    tcHahs_18.in[0] <== evals[37][1];
    tcHahs_18.in[1] <== evals[37][2];
    tcHahs_18.in[2] <== evals[38][0];
    tcHahs_18.in[3] <== evals[38][1];
    tcHahs_18.in[4] <== evals[38][2];
    tcHahs_18.in[5] <== evals[39][0];
    tcHahs_18.in[6] <== evals[39][1];
    tcHahs_18.in[7] <== evals[39][2];
    tcHahs_18.capacity[0] <== tcHahs_17.out[0];
    tcHahs_18.capacity[1] <== tcHahs_17.out[1];
    tcHahs_18.capacity[2] <== tcHahs_17.out[2];
    tcHahs_18.capacity[3] <== tcHahs_17.out[3];
    component tcHahs_19 = Poseidon(12);
    tcHahs_19.in[0] <== evals[40][0];
    tcHahs_19.in[1] <== evals[40][1];
    tcHahs_19.in[2] <== evals[40][2];
    tcHahs_19.in[3] <== evals[41][0];
    tcHahs_19.in[4] <== evals[41][1];
    tcHahs_19.in[5] <== evals[41][2];
    tcHahs_19.in[6] <== evals[42][0];
    tcHahs_19.in[7] <== evals[42][1];
    tcHahs_19.capacity[0] <== tcHahs_18.out[0];
    tcHahs_19.capacity[1] <== tcHahs_18.out[1];
    tcHahs_19.capacity[2] <== tcHahs_18.out[2];
    tcHahs_19.capacity[3] <== tcHahs_18.out[3];
    component tcHahs_20 = Poseidon(12);
    tcHahs_20.in[0] <== evals[42][2];
    tcHahs_20.in[1] <== evals[43][0];
    tcHahs_20.in[2] <== evals[43][1];
    tcHahs_20.in[3] <== evals[43][2];
    tcHahs_20.in[4] <== evals[44][0];
    tcHahs_20.in[5] <== evals[44][1];
    tcHahs_20.in[6] <== evals[44][2];
    tcHahs_20.in[7] <== evals[45][0];
    tcHahs_20.capacity[0] <== tcHahs_19.out[0];
    tcHahs_20.capacity[1] <== tcHahs_19.out[1];
    tcHahs_20.capacity[2] <== tcHahs_19.out[2];
    tcHahs_20.capacity[3] <== tcHahs_19.out[3];
    component tcHahs_21 = Poseidon(12);
    tcHahs_21.in[0] <== evals[45][1];
    tcHahs_21.in[1] <== evals[45][2];
    tcHahs_21.in[2] <== evals[46][0];
    tcHahs_21.in[3] <== evals[46][1];
    tcHahs_21.in[4] <== evals[46][2];
    tcHahs_21.in[5] <== evals[47][0];
    tcHahs_21.in[6] <== evals[47][1];
    tcHahs_21.in[7] <== evals[47][2];
    tcHahs_21.capacity[0] <== tcHahs_20.out[0];
    tcHahs_21.capacity[1] <== tcHahs_20.out[1];
    tcHahs_21.capacity[2] <== tcHahs_20.out[2];
    tcHahs_21.capacity[3] <== tcHahs_20.out[3];
    component tcHahs_22 = Poseidon(12);
    tcHahs_22.in[0] <== evals[48][0];
    tcHahs_22.in[1] <== evals[48][1];
    tcHahs_22.in[2] <== evals[48][2];
    tcHahs_22.in[3] <== evals[49][0];
    tcHahs_22.in[4] <== evals[49][1];
    tcHahs_22.in[5] <== evals[49][2];
    tcHahs_22.in[6] <== evals[50][0];
    tcHahs_22.in[7] <== evals[50][1];
    tcHahs_22.capacity[0] <== tcHahs_21.out[0];
    tcHahs_22.capacity[1] <== tcHahs_21.out[1];
    tcHahs_22.capacity[2] <== tcHahs_21.out[2];
    tcHahs_22.capacity[3] <== tcHahs_21.out[3];
    component tcHahs_23 = Poseidon(12);
    tcHahs_23.in[0] <== evals[50][2];
    tcHahs_23.in[1] <== evals[51][0];
    tcHahs_23.in[2] <== evals[51][1];
    tcHahs_23.in[3] <== evals[51][2];
    tcHahs_23.in[4] <== evals[52][0];
    tcHahs_23.in[5] <== evals[52][1];
    tcHahs_23.in[6] <== evals[52][2];
    tcHahs_23.in[7] <== evals[53][0];
    tcHahs_23.capacity[0] <== tcHahs_22.out[0];
    tcHahs_23.capacity[1] <== tcHahs_22.out[1];
    tcHahs_23.capacity[2] <== tcHahs_22.out[2];
    tcHahs_23.capacity[3] <== tcHahs_22.out[3];
    component tcHahs_24 = Poseidon(12);
    tcHahs_24.in[0] <== evals[53][1];
    tcHahs_24.in[1] <== evals[53][2];
    tcHahs_24.in[2] <== evals[54][0];
    tcHahs_24.in[3] <== evals[54][1];
    tcHahs_24.in[4] <== evals[54][2];
    tcHahs_24.in[5] <== evals[55][0];
    tcHahs_24.in[6] <== evals[55][1];
    tcHahs_24.in[7] <== evals[55][2];
    tcHahs_24.capacity[0] <== tcHahs_23.out[0];
    tcHahs_24.capacity[1] <== tcHahs_23.out[1];
    tcHahs_24.capacity[2] <== tcHahs_23.out[2];
    tcHahs_24.capacity[3] <== tcHahs_23.out[3];
    component tcHahs_25 = Poseidon(12);
    tcHahs_25.in[0] <== evals[56][0];
    tcHahs_25.in[1] <== evals[56][1];
    tcHahs_25.in[2] <== evals[56][2];
    tcHahs_25.in[3] <== evals[57][0];
    tcHahs_25.in[4] <== evals[57][1];
    tcHahs_25.in[5] <== evals[57][2];
    tcHahs_25.in[6] <== evals[58][0];
    tcHahs_25.in[7] <== evals[58][1];
    tcHahs_25.capacity[0] <== tcHahs_24.out[0];
    tcHahs_25.capacity[1] <== tcHahs_24.out[1];
    tcHahs_25.capacity[2] <== tcHahs_24.out[2];
    tcHahs_25.capacity[3] <== tcHahs_24.out[3];
    component tcHahs_26 = Poseidon(12);
    tcHahs_26.in[0] <== evals[58][2];
    tcHahs_26.in[1] <== 0;
    tcHahs_26.in[2] <== 0;
    tcHahs_26.in[3] <== 0;
    tcHahs_26.in[4] <== 0;
    tcHahs_26.in[5] <== 0;
    tcHahs_26.in[6] <== 0;
    tcHahs_26.in[7] <== 0;
    tcHahs_26.capacity[0] <== tcHahs_25.out[0];
    tcHahs_26.capacity[1] <== tcHahs_25.out[1];
    tcHahs_26.capacity[2] <== tcHahs_25.out[2];
    tcHahs_26.capacity[3] <== tcHahs_25.out[3];
    challenges[5][0] <== tcHahs_26.out[0];
    challenges[5][1] <== tcHahs_26.out[1];
    challenges[5][2] <== tcHahs_26.out[2];
    challenges[6][0] <== tcHahs_26.out[3];
    challenges[6][1] <== tcHahs_26.out[4];
    challenges[6][2] <== tcHahs_26.out[5];
    s0_specialX[0] <== tcHahs_26.out[6];
    s0_specialX[1] <== tcHahs_26.out[7];
    s0_specialX[2] <== tcHahs_26.out[8];
    component tcHahs_27 = Poseidon(12);
    tcHahs_27.in[0] <== s1_root[0];
    tcHahs_27.in[1] <== s1_root[1];
    tcHahs_27.in[2] <== s1_root[2];
    tcHahs_27.in[3] <== s1_root[3];
    tcHahs_27.in[4] <== 0;
    tcHahs_27.in[5] <== 0;
    tcHahs_27.in[6] <== 0;
    tcHahs_27.in[7] <== 0;
    tcHahs_27.capacity[0] <== tcHahs_26.out[0];
    tcHahs_27.capacity[1] <== tcHahs_26.out[1];
    tcHahs_27.capacity[2] <== tcHahs_26.out[2];
    tcHahs_27.capacity[3] <== tcHahs_26.out[3];
    s1_specialX[0] <== tcHahs_27.out[0];
    s1_specialX[1] <== tcHahs_27.out[1];
    s1_specialX[2] <== tcHahs_27.out[2];
    component tcHahs_28 = Poseidon(12);
    tcHahs_28.in[0] <== s2_root[0];
    tcHahs_28.in[1] <== s2_root[1];
    tcHahs_28.in[2] <== s2_root[2];
    tcHahs_28.in[3] <== s2_root[3];
    tcHahs_28.in[4] <== 0;
    tcHahs_28.in[5] <== 0;
    tcHahs_28.in[6] <== 0;
    tcHahs_28.in[7] <== 0;
    tcHahs_28.capacity[0] <== tcHahs_27.out[0];
    tcHahs_28.capacity[1] <== tcHahs_27.out[1];
    tcHahs_28.capacity[2] <== tcHahs_27.out[2];
    tcHahs_28.capacity[3] <== tcHahs_27.out[3];
    s2_specialX[0] <== tcHahs_28.out[0];
    s2_specialX[1] <== tcHahs_28.out[1];
    s2_specialX[2] <== tcHahs_28.out[2];
    component tcHahs_29 = Poseidon(12);
    tcHahs_29.in[0] <== finalPol[0][0];
    tcHahs_29.in[1] <== finalPol[0][1];
    tcHahs_29.in[2] <== finalPol[0][2];
    tcHahs_29.in[3] <== finalPol[1][0];
    tcHahs_29.in[4] <== finalPol[1][1];
    tcHahs_29.in[5] <== finalPol[1][2];
    tcHahs_29.in[6] <== finalPol[2][0];
    tcHahs_29.in[7] <== finalPol[2][1];
    tcHahs_29.capacity[0] <== tcHahs_28.out[0];
    tcHahs_29.capacity[1] <== tcHahs_28.out[1];
    tcHahs_29.capacity[2] <== tcHahs_28.out[2];
    tcHahs_29.capacity[3] <== tcHahs_28.out[3];
    component tcHahs_30 = Poseidon(12);
    tcHahs_30.in[0] <== finalPol[2][2];
    tcHahs_30.in[1] <== finalPol[3][0];
    tcHahs_30.in[2] <== finalPol[3][1];
    tcHahs_30.in[3] <== finalPol[3][2];
    tcHahs_30.in[4] <== finalPol[4][0];
    tcHahs_30.in[5] <== finalPol[4][1];
    tcHahs_30.in[6] <== finalPol[4][2];
    tcHahs_30.in[7] <== finalPol[5][0];
    tcHahs_30.capacity[0] <== tcHahs_29.out[0];
    tcHahs_30.capacity[1] <== tcHahs_29.out[1];
    tcHahs_30.capacity[2] <== tcHahs_29.out[2];
    tcHahs_30.capacity[3] <== tcHahs_29.out[3];
    component tcHahs_31 = Poseidon(12);
    tcHahs_31.in[0] <== finalPol[5][1];
    tcHahs_31.in[1] <== finalPol[5][2];
    tcHahs_31.in[2] <== finalPol[6][0];
    tcHahs_31.in[3] <== finalPol[6][1];
    tcHahs_31.in[4] <== finalPol[6][2];
    tcHahs_31.in[5] <== finalPol[7][0];
    tcHahs_31.in[6] <== finalPol[7][1];
    tcHahs_31.in[7] <== finalPol[7][2];
    tcHahs_31.capacity[0] <== tcHahs_30.out[0];
    tcHahs_31.capacity[1] <== tcHahs_30.out[1];
    tcHahs_31.capacity[2] <== tcHahs_30.out[2];
    tcHahs_31.capacity[3] <== tcHahs_30.out[3];
    component tcN2b_0 = Num2Bits_strict();
    tcN2b_0.in <== tcHahs_31.out[0];
    component tcN2b_1 = Num2Bits_strict();
    tcN2b_1.in <== tcHahs_31.out[1];
    ys[0][0] <== tcN2b_0.out[0];
    ys[0][1] <== tcN2b_0.out[1];
    ys[0][2] <== tcN2b_0.out[2];
    ys[0][3] <== tcN2b_0.out[3];
    ys[0][4] <== tcN2b_0.out[4];
    ys[0][5] <== tcN2b_0.out[5];
    ys[0][6] <== tcN2b_0.out[6];
    ys[0][7] <== tcN2b_0.out[7];
    ys[0][8] <== tcN2b_0.out[8];
    ys[0][9] <== tcN2b_0.out[9];
    ys[0][10] <== tcN2b_0.out[10];
    ys[1][0] <== tcN2b_0.out[11];
    ys[1][1] <== tcN2b_0.out[12];
    ys[1][2] <== tcN2b_0.out[13];
    ys[1][3] <== tcN2b_0.out[14];
    ys[1][4] <== tcN2b_0.out[15];
    ys[1][5] <== tcN2b_0.out[16];
    ys[1][6] <== tcN2b_0.out[17];
    ys[1][7] <== tcN2b_0.out[18];
    ys[1][8] <== tcN2b_0.out[19];
    ys[1][9] <== tcN2b_0.out[20];
    ys[1][10] <== tcN2b_0.out[21];
    ys[2][0] <== tcN2b_0.out[22];
    ys[2][1] <== tcN2b_0.out[23];
    ys[2][2] <== tcN2b_0.out[24];
    ys[2][3] <== tcN2b_0.out[25];
    ys[2][4] <== tcN2b_0.out[26];
    ys[2][5] <== tcN2b_0.out[27];
    ys[2][6] <== tcN2b_0.out[28];
    ys[2][7] <== tcN2b_0.out[29];
    ys[2][8] <== tcN2b_0.out[30];
    ys[2][9] <== tcN2b_0.out[31];
    ys[2][10] <== tcN2b_0.out[32];
    ys[3][0] <== tcN2b_0.out[33];
    ys[3][1] <== tcN2b_0.out[34];
    ys[3][2] <== tcN2b_0.out[35];
    ys[3][3] <== tcN2b_0.out[36];
    ys[3][4] <== tcN2b_0.out[37];
    ys[3][5] <== tcN2b_0.out[38];
    ys[3][6] <== tcN2b_0.out[39];
    ys[3][7] <== tcN2b_0.out[40];
    ys[3][8] <== tcN2b_0.out[41];
    ys[3][9] <== tcN2b_0.out[42];
    ys[3][10] <== tcN2b_0.out[43];
    ys[4][0] <== tcN2b_0.out[44];
    ys[4][1] <== tcN2b_0.out[45];
    ys[4][2] <== tcN2b_0.out[46];
    ys[4][3] <== tcN2b_0.out[47];
    ys[4][4] <== tcN2b_0.out[48];
    ys[4][5] <== tcN2b_0.out[49];
    ys[4][6] <== tcN2b_0.out[50];
    ys[4][7] <== tcN2b_0.out[51];
    ys[4][8] <== tcN2b_0.out[52];
    ys[4][9] <== tcN2b_0.out[53];
    ys[4][10] <== tcN2b_0.out[54];
    ys[5][0] <== tcN2b_0.out[55];
    ys[5][1] <== tcN2b_0.out[56];
    ys[5][2] <== tcN2b_0.out[57];
    ys[5][3] <== tcN2b_0.out[58];
    ys[5][4] <== tcN2b_0.out[59];
    ys[5][5] <== tcN2b_0.out[60];
    ys[5][6] <== tcN2b_0.out[61];
    ys[5][7] <== tcN2b_0.out[62];
    ys[5][8] <== tcN2b_1.out[0];
    ys[5][9] <== tcN2b_1.out[1];
    ys[5][10] <== tcN2b_1.out[2];
    ys[6][0] <== tcN2b_1.out[3];
    ys[6][1] <== tcN2b_1.out[4];
    ys[6][2] <== tcN2b_1.out[5];
    ys[6][3] <== tcN2b_1.out[6];
    ys[6][4] <== tcN2b_1.out[7];
    ys[6][5] <== tcN2b_1.out[8];
    ys[6][6] <== tcN2b_1.out[9];
    ys[6][7] <== tcN2b_1.out[10];
    ys[6][8] <== tcN2b_1.out[11];
    ys[6][9] <== tcN2b_1.out[12];
    ys[6][10] <== tcN2b_1.out[13];
    ys[7][0] <== tcN2b_1.out[14];
    ys[7][1] <== tcN2b_1.out[15];
    ys[7][2] <== tcN2b_1.out[16];
    ys[7][3] <== tcN2b_1.out[17];
    ys[7][4] <== tcN2b_1.out[18];
    ys[7][5] <== tcN2b_1.out[19];
    ys[7][6] <== tcN2b_1.out[20];
    ys[7][7] <== tcN2b_1.out[21];
    ys[7][8] <== tcN2b_1.out[22];
    ys[7][9] <== tcN2b_1.out[23];
    ys[7][10] <== tcN2b_1.out[24];

///////////
// Constrain polynomial check in vauations
///////////
    component verifyEvaluations = VerifyEvaluations();
    verifyEvaluations.enable <== enable;
    for (var i=0; i<8; i++) {
        for (var k=0; k<3; k++) {
            verifyEvaluations.challenges[i][k] <== challenges[i][k];
        }
    }
    for (var i=0; i<0; i++) {
        verifyEvaluations.publics[i] <== publics[i];
    }
    for (var i=0; i<59; i++) {
        for (var k=0; k<3; k++) {
            verifyEvaluations.evals[i][k] <== evals[i][k];
        }
    }

///////////
// Step0 Check and evaluate queries
///////////

    component verifyQueries[8];
    component s0_merkle1[8];


    component s0_merkle4[8];
    component s0_merkleC[8];
    component s0_lowValues[8];

    for (var q=0; q<8; q++) {
        verifyQueries[q] = VerifyQuery();
        s0_merkle1[q] = MerkleHash(1, 19, 2048);


        s0_merkle4[q] = MerkleHash(1, 24, 2048);
        s0_merkleC[q] = MerkleHash(1, 16, 2048);
        s0_lowValues[q] = TreeSelector(4, 3) ;

        for (var i=0; i<11; i++ ) {
            verifyQueries[q].ys[i] <== ys[q][i];
            s0_merkle1[q].key[i] <== ys[q][i];


            s0_merkle4[q].key[i] <== ys[q][i];
            s0_merkleC[q].key[i] <== ys[q][i];
        }
        for (var i=0; i<19; i++ ) {
            verifyQueries[q].tree1[i] <== s0_vals1[q][i];
            s0_merkle1[q].values[i][0] <== s0_vals1[q][i];
        }


        for (var i=0; i<24; i++ ) {
            verifyQueries[q].tree4[i] <== s0_vals4[q][i];
            s0_merkle4[q].values[i][0] <== s0_vals4[q][i];
        }
        for (var i=0; i<16; i++ ) {
            verifyQueries[q].consts[i] <== s0_valsC[q][i];
            s0_merkleC[q].values[i][0] <== s0_valsC[q][i];
        }
        for (var i=0; i<8; i++) {
            for (var e=0; e<3; e++) {
                verifyQueries[q].challenges[i][e] <== challenges[i][e];
            }
        }
        for (var i=0; i<59; i++) {
            for (var e=0; e<3; e++) {
                verifyQueries[q].evals[i][e] <== evals[i][e];
            }
        }
        for (var i=0; i<11;i++) {
            for (var j=0; j<4; j++) {
                s0_merkle1[q].siblings[i][j] <== s0_siblings1[q][i][j];


                s0_merkle4[q].siblings[i][j] <== s0_siblings4[q][i][j];
                s0_merkleC[q].siblings[i][j] <== s0_siblingsC[q][i][j];
            }
        }

        for (var j=0; j<4; j++) {
            enable * (s0_merkle1[q].root[j] - root1[j]) === 0;


            enable * (s0_merkle4[q].root[j] - root4[j]) === 0;
            enable * (s0_merkleC[q].root[j] - rootC[j]) === 0;
        }

        for (var i=0; i<16; i++) {
            for (var e=0; e<3; e++) {
                s0_lowValues[q].values[i][e] <== s1_vals[q][i*3+e];
            }
        }
        for (var i=0; i<4; i++) {
            s0_lowValues[q].key[i] <== ys[q][i + 7];
        }
        for (var e=0; e<3; e++) {
            enable * (s0_lowValues[q].out[e] - verifyQueries[q].out[e]) === 0;
        }

    }

    component s1_merkle[8];
    component s1_fft[8];
    component s1_evalPol[8];
    component s1_lowValues[8];
    signal s1_sx[8][7];

    for (var q=0; q<8; q++) {
        s1_merkle[q] = MerkleHash(3, 16, 128);
        s1_fft[q] = FFT(4, 3, 1, 1);
        s1_evalPol[q] = EvalPol(16);
        s1_lowValues[q] = TreeSelector(4, 3) ;
        for (var i=0; i< 16; i++) {
            for (var e=0; e<3; e++) {
                s1_merkle[q].values[i][e] <== s1_vals[q][i*3+e];
                s1_fft[q].in[i][e] <== s1_vals[q][i*3+e];
            }
        }
        for (var i=0; i<7; i++) {
            for (var j=0; j<4; j++) {
                s1_merkle[q].siblings[i][j] <== s1_siblings[q][i][j];
            }
            s1_merkle[q].key[i] <== ys[q][i];
        }
        s1_sx[q][0] <==  5646962470228954384 *  ( ys[q][0] * 8548973421900915980 +1);
        for (var i=1; i<7; i++) {
            s1_sx[q][i] <== s1_sx[q][i-1] *  ( ys[q][i] * ((1/roots(11 -i)) -1) +1);
        }
        for (var i=0; i< 16; i++) {
            for (var e=0; e<3; e++) {
                s1_evalPol[q].pol[i][e] <== s1_fft[q].out[i][e];
            }
        }
        for (var e=0; e<3; e++) {
            s1_evalPol[q].x[e] <== s1_specialX[e] *  s1_sx[q][6];
        }
        for (var i=0; i<16; i++) {
            for (var e=0; e<3; e++) {
                s1_lowValues[q].values[i][e] <== s2_vals[q][i*3+e];
            }
        }
        for (var i=0; i<4; i++) {
            s1_lowValues[q].key[i] <== ys[q][i + 3];
        }
        for (var e=0; e<3; e++) {
            enable * (s1_lowValues[q].out[e] - s1_evalPol[q].out[e]) === 0;
        }

        enable * (s1_merkle[q].root[0] - s1_root[0]) === 0;
        enable * (s1_merkle[q].root[1] - s1_root[1]) === 0;
        enable * (s1_merkle[q].root[2] - s1_root[2]) === 0;
        enable * (s1_merkle[q].root[3] - s1_root[3]) === 0;
    }
    component s2_merkle[8];
    component s2_fft[8];
    component s2_evalPol[8];
    component s2_lowValues[8];
    signal s2_sx[8][3];

    for (var q=0; q<8; q++) {
        s2_merkle[q] = MerkleHash(3, 16, 8);
        s2_fft[q] = FFT(4, 3, 1, 1);
        s2_evalPol[q] = EvalPol(16);
        s2_lowValues[q] = TreeSelector(3, 3) ;
        for (var i=0; i< 16; i++) {
            for (var e=0; e<3; e++) {
                s2_merkle[q].values[i][e] <== s2_vals[q][i*3+e];
                s2_fft[q].in[i][e] <== s2_vals[q][i*3+e];
            }
        }
        for (var i=0; i<3; i++) {
            for (var j=0; j<4; j++) {
                s2_merkle[q].siblings[i][j] <== s2_siblings[q][i][j];
            }
            s2_merkle[q].key[i] <== ys[q][i];
        }
        s2_sx[q][0] <==  2058312433970512828 *  ( ys[q][0] * 18442240469787213840 +1);
        for (var i=1; i<3; i++) {
            s2_sx[q][i] <== s2_sx[q][i-1] *  ( ys[q][i] * ((1/roots(7 -i)) -1) +1);
        }
        for (var i=0; i< 16; i++) {
            for (var e=0; e<3; e++) {
                s2_evalPol[q].pol[i][e] <== s2_fft[q].out[i][e];
            }
        }
        for (var e=0; e<3; e++) {
            s2_evalPol[q].x[e] <== s2_specialX[e] *  s2_sx[q][2];
        }
        for (var i=0; i<8; i++) {
            for (var e=0; e<3; e++) {
                s2_lowValues[q].values[i][e] <== finalPol[i][e];
            }
        }
        for (var i=0; i<3; i++) {
            s2_lowValues[q].key[i] <== ys[q][i];
        }
        for (var e=0; e<3; e++) {
            enable * (s2_lowValues[q].out[e] - s2_evalPol[q].out[e]) === 0;
        }

        enable * (s2_merkle[q].root[0] - s2_root[0]) === 0;
        enable * (s2_merkle[q].root[1] - s2_root[1]) === 0;
        enable * (s2_merkle[q].root[2] - s2_root[2]) === 0;
        enable * (s2_merkle[q].root[3] - s2_root[3]) === 0;
    }

///////
// Check Degree last pol
///////
// Last FFT
    component lastIFFT = FFT(3, 3, 1, 1 );

    for (var k=0; k< 8; k++ ){
        for (var e=0; e<3; e++) {
            lastIFFT.in[k][e] <== finalPol[k][e];
        }
    }

    for (var k= 1; k< 8; k++ ) {
        for (var e=0; e<3; e++) {
            enable * lastIFFT.out[k][e] === 0;
        }
    }

}

component main {public [publics]}= StarkVerifier();
