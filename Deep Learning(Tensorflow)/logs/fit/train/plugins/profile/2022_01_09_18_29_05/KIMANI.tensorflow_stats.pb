"�C
BHostIDLE"IDLE1����
_*AA����
_*Aa|X��7�?i|X��7�?�Unknown
iHostWriteSummary"WriteSummary(1ffff��$A9ffff��$AAffff��$AIffff��$Aa�ĕ�
��?i���e�?�Unknown�
sHost_FusedMatMul"sequential_4/dense_8/Relu(1    ��A9    ��AA    ��AI    ��AaW6�pth�?ic��r��?�Unknown
dHostDataset"Iterator::Model(1ffff��@9ffff��@Affff���@Iffff���@a��XSa�?i>D���?�Unknown
vHost_FusedMatMul"sequential_4/dense_9/BiasAdd(1     �@9     �@A     �@I     �@a�i�kh�?ih��FH��?�Unknown
�HostDataset"/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap(1    x;�@9    x;�@A����I:�@I����I:�@aY���6��?i�q_�;��?�Unknown
}HostMatMul")gradient_tape/sequential_4/dense_8/MatMul(1fffff��@9fffff��@Afffff��@Ifffff��@a=>�lv�V?i-�o���?�Unknown
^HostGatherV2"GatherV2(133333�@933333�@A33333�@I33333�@aF9v� �S?iJ"��c��?�Unknown
�	Host#SparseSoftmaxCrossEntropyWithLogits"gsparse_categorical_crossentropy/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits(1fffffs@9fffffs@Afffffs@Ifffffs@aQ��#?iO�̗���?�Unknown
}
HostMatMul")gradient_tape/sequential_4/dense_9/MatMul(1fffff�q@9fffff�q@Afffff�q@Ifffff�q@a�ܮ�."?i�W����?�Unknown
�HostResourceApplyGradientDescent"+SGD/SGD/update/ResourceApplyGradientDescent(1     �c@9     �c@A     �c@I     �c@a4���P�?i��f��?�Unknown
HostMatMul"+gradient_tape/sequential_4/dense_9/MatMul_1(1�����|a@9�����|a@A�����|a@I�����|a@a�܂�?i��;~���?�Unknown
�HostDataset"5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat(1     �S@9     �S@A������P@I������P@a����?i��Ӑ<��?�Unknown
�HostSelectV2"Fgradient_tape/sparse_categorical_crossentropy/clip_by_value/SelectV2_1(1     �D@9     �D@A     �D@I     �D@a�.�x�i�>i}��dg��?�Unknown
�HostMul"Ugradient_tape/sparse_categorical_crossentropy/SparseSoftmaxCrossEntropyWithLogits/mul(1fffff�C@9fffff�C@Afffff�C@Ifffff�C@aۖoh��>i�{�w���?�Unknown
�HostSelectV2"Dgradient_tape/sparse_categorical_crossentropy/clip_by_value/SelectV2(1333333C@9333333C@A333333C@I333333C@am��Wy��>iG+����?�Unknown
sHostDataset"Iterator::Model::ParallelMapV2(1     �B@9     �B@A     �B@I     �B@aJ���Y�>i�*�����?�Unknown
xHostDataset"#Iterator::Model::ParallelMapV2::Zip(1���̬B�@9���̬B�@AffffffB@IffffffB@a�/���>i9����?�Unknown
�Host	LessEqual"Egradient_tape/sparse_categorical_crossentropy/clip_by_value/LessEqual(1�����L9@9�����L9@A�����L9@I�����L9@az���
�>i������?�Unknown
`HostGatherV2"
GatherV2_1(13333338@93333338@A3333338@I3333338@a^�Fn��>i��k�7��?�Unknown
�HostResourceApplyGradientDescent"-SGD/SGD/update_3/ResourceApplyGradientDescent(1fffff�7@9fffff�7@Afffff�7@Ifffff�7@a��Ya,��>iK��P��?�Unknown
�HostReluGrad"+gradient_tape/sequential_4/dense_8/ReluGrad(1������7@9������7@A������7@I������7@a�X�{�Z�>iǂ�h��?�Unknown
VHostSum"Sum_2(1ffffff5@9ffffff5@Affffff5@Iffffff5@a�����>i�4�~��?�Unknown
ZHostArgMax"ArgMax(13333335@93333335@A3333335@I3333335@a�B�P���>i�ה��?�Unknown
�HostSum"1sparse_categorical_crossentropy/weighted_loss/Sum(1������4@9������4@A������4@I������4@aJ}@�WB�>i1�g���?�Unknown
�HostDataset"?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice(1fffff�2@9fffff�2@Afffff�2@Ifffff�2@a�Myr7��>i�������?�Unknown
�HostResourceApplyGradientDescent"-SGD/SGD/update_2/ResourceApplyGradientDescent(133333�2@933333�2@A33333�2@I33333�2@a���`L�>i9������?�Unknown
�HostCast"BArithmeticOptimizer/ReorderCastLikeAndValuePreserving_float_Cast_1(1������2@9������2@A������2@I������2@a����1�>iSa����?�Unknown
�HostBiasAddGrad"6gradient_tape/sequential_4/dense_9/BiasAdd/BiasAddGrad(1     �0@9     �0@A     �0@I     �0@a�7~G(�>iѨ ���?�Unknown
eHost
LogicalAnd"
LogicalAnd(1333333.@9333333.@A333333.@I333333.@a��,2�*�>i��g���?�Unknown�
tHostAssignAddVariableOp"AssignAddVariableOp(1������-@9������-@A������-@I������-@a�QX ���>iB���?�Unknown
q HostSigmoid"sequential_4/dense_9/Sigmoid(1������+@9������+@A������+@I������+@a�}Gn�{�>i7y�S"��?�Unknown
l!HostIteratorGetNext"IteratorGetNext(1������)@9������)@A������)@I������)@a-#��>i= ģ/��?�Unknown
u"HostFlushSummaryWriter"FlushSummaryWriter(1333333&@9333333&@A333333&@I333333&@a���M��>i'J;��?�Unknown�
�#HostResourceApplyGradientDescent"-SGD/SGD/update_1/ResourceApplyGradientDescent(1������%@9������%@A������%@I������%@a{�ӂ�J�>iph�=F��?�Unknown
�$HostBiasAddGrad"6gradient_tape/sequential_4/dense_8/BiasAdd/BiasAddGrad(1������%@9������%@A������%@I������%@a{�ӂ�J�>iک�bQ��?�Unknown
�%HostDataset"AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor(1333333%@9333333@A333333%@I333333@a�B�P���>iZR@S\��?�Unknown
v&HostAssignAddVariableOp"AssignAddVariableOp_2(1������$@9������$@A������$@I������$@a!�*.w�>i�a�g��?�Unknown
|'HostAssignAddVariableOp"SGD/SGD/AssignAddVariableOp(1������#@9������#@A������#@I������#@a�u�"�n�>i;�UFq��?�Unknown
�(HostGreaterEqual"Hgradient_tape/sparse_categorical_crossentropy/clip_by_value/GreaterEqual(1������#@9������#@A������#@I������#@a4��&:�>i8ic{��?�Unknown
�)HostCast"bsparse_categorical_crossentropy/ArithmeticOptimizer/ReorderCastLikeAndValuePreserving_int64_Cast_1(1       @9       @A       @I       @a�4���>i����?�Unknown
�*HostReadVariableOp"+sequential_4/dense_9/BiasAdd/ReadVariableOp(1333333@9333333@A333333@I333333@aX`�b�>i\h�����?�Unknown
�+HostMinimum"5sparse_categorical_crossentropy/clip_by_value/Minimum(1333333@9333333@A333333@I333333@aX`�b�>i�S����?�Unknown
X,HostEqual"Equal(1������@9������@A������@I������@aCv�
T��>i��h����?�Unknown
�-Host
Reciprocal"8gradient_tape/sparse_categorical_crossentropy/Reciprocal(1ffffff@9ffffff@Affffff@Iffffff@a���ئ>�>i�lx���?�Unknown
X.HostCast"Cast_2(1������@9������@A������@I������@a<� uLk�>i.�����?�Unknown
t/HostLog"#sparse_categorical_crossentropy/Log(1������@9������@A������@I������@a<� uLk�>iv������?�Unknown
b0HostDivNoNan"div_no_nan_1(1333333@9333333@A333333@I333333@a�gLC��>iIx .���?�Unknown
�1HostMaximum"-sparse_categorical_crossentropy/clip_by_value(1ffffff@9ffffff@Affffff@Iffffff@a��|���>i�1�����?�Unknown
v2HostAssignAddVariableOp"AssignAddVariableOp_4(1333333@9333333@A333333@I333333@a�B�P���>i(�m���?�Unknown
�3HostDivNoNan"3sparse_categorical_crossentropy/weighted_loss/value(1333333@9333333@A333333@I333333@a�B�P���>ih�����?�Unknown
X4HostCast"Cast_3(1ffffff@9ffffff@Affffff@Iffffff@as;V��>i�g)���?�Unknown
�5HostSigmoidGrad"6gradient_tape/sequential_4/dense_9/Sigmoid/SigmoidGrad(1������@9������@A������@I������@a4��&:�>i)��7���?�Unknown
v6HostAssignAddVariableOp"AssignAddVariableOp_3(1333333@9333333@A333333@I333333@a�^��>i֏�����?�Unknown
`7HostDivNoNan"
div_no_nan(1������@9������@A������@I������@a_��,jV�>i�����?�Unknown
s8HostReadVariableOp"SGD/Cast/ReadVariableOp(1ffffff@9ffffff@Affffff@Iffffff@a�	����>i�Y�8���?�Unknown
v9HostAssignAddVariableOp"AssignAddVariableOp_1(1ffffff@9ffffff@Affffff@Iffffff@aW�j_�>i2��$���?�Unknown
�:HostMul"1gradient_tape/sparse_categorical_crossentropy/mul(1������	@9������	@A������	@I������	@a<� uLk�>i�Ar���?�Unknown
�;HostReadVariableOp"+sequential_4/dense_8/BiasAdd/ReadVariableOp(1������	@9������	@A������	@I������	@a<� uLk�>izЀ����?�Unknown
w<HostReadVariableOp"div_no_nan/ReadVariableOp_1(1      @9      @A      @I      @a��έ�ĸ>i4�����?�Unknown
a=HostIdentity"Identity(1ffffff@9ffffff@Affffff@Iffffff@a��|���>i#л���?�Unknown�
y>HostReadVariableOp"div_no_nan_1/ReadVariableOp_1(1ffffff@9ffffff@Affffff@Iffffff@a��|���>i������?�Unknown
X?HostCast"Cast_1(1������@9������@A������@I������@a{�ӂ�J�>i.��h���?�Unknown
�@HostReadVariableOp"*sequential_4/dense_8/MatMul/ReadVariableOp(1������@9������@A������@I������@a{�ӂ�J�>i��.2���?�Unknown
�AHostReadVariableOp"*sequential_4/dense_9/MatMul/ReadVariableOp(1������@9������@A������@I������@a{�ӂ�J�>i�����?�Unknown
wBHostReadVariableOp"div_no_nan_1/ReadVariableOp(1������@9������@A������@I������@a!�*.w�>i�te����?�Unknown
TCHostMul"Mul(1������ @9������ @A������ @I������ @a_��,jV�>ic�2����?�Unknown
uDHostReadVariableOp"div_no_nan/ReadVariableOp(1������ @9������ @A������ @I������ @a_��,jV�>i�������?�Unknown*�C
iHostWriteSummary"WriteSummary(1ffff��$A9ffff��$AAffff��$AIffff��$Aa��y�{��?i��y�{��?�Unknown�
sHost_FusedMatMul"sequential_4/dense_8/Relu(1    ��A9    ��AA    ��AI    ��Aa�1�ɐ��?iCm��_m�?�Unknown
dHostDataset"Iterator::Model(1ffff��@9ffff��@Affff���@Iffff���@a`jU��?i�z����?�Unknown
vHost_FusedMatMul"sequential_4/dense_9/BiasAdd(1     �@9     �@A     �@I     �@ar��"��?i�h�g��?�Unknown
�HostDataset"/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap(1    x;�@9    x;�@A����I:�@I����I:�@a&k#�?i3[�����?�Unknown
}HostMatMul")gradient_tape/sequential_4/dense_8/MatMul(1fffff��@9fffff��@Afffff��@Ifffff��@a;� b	�c?i�{�l��?�Unknown
^HostGatherV2"GatherV2(133333�@933333�@A33333�@I33333�@aH�^�[a?i��l���?�Unknown
�Host#SparseSoftmaxCrossEntropyWithLogits"gsparse_categorical_crossentropy/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits(1fffffs@9fffffs@Afffffs@Ifffffs@a˅��1?ip�)����?�Unknown
}	HostMatMul")gradient_tape/sequential_4/dense_9/MatMul(1fffff�q@9fffff�q@Afffff�q@Ifffff�q@a��|�/?i��ꮝ��?�Unknown
�
HostResourceApplyGradientDescent"+SGD/SGD/update/ResourceApplyGradientDescent(1     �c@9     �c@A     �c@I     �c@a1���&�!?i�T���?�Unknown
HostMatMul"+gradient_tape/sequential_4/dense_9/MatMul_1(1�����|a@9�����|a@A�����|a@I�����|a@aBi��'f?i�:�B���?�Unknown
�HostDataset"5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat(1     �S@9     �S@A������P@I������P@a�@~�z?i�3�,1��?�Unknown
�HostSelectV2"Fgradient_tape/sparse_categorical_crossentropy/clip_by_value/SelectV2_1(1     �D@9     �D@A     �D@I     �D@a��X�?i-�q�{��?�Unknown
�HostMul"Ugradient_tape/sparse_categorical_crossentropy/SparseSoftmaxCrossEntropyWithLogits/mul(1fffff�C@9fffff�C@Afffff�C@Ifffff�C@aN7C��?i
��&���?�Unknown
�HostSelectV2"Dgradient_tape/sparse_categorical_crossentropy/clip_by_value/SelectV2(1333333C@9333333C@A333333C@I333333C@a�_P}�<?iK�0��?�Unknown
sHostDataset"Iterator::Model::ParallelMapV2(1     �B@9     �B@A     �B@I     �B@a�}`�;� ?i��nK��?�Unknown
xHostDataset"#Iterator::Model::ParallelMapV2::Zip(1���̬B�@9���̬B�@AffffffB@IffffffB@a�m-˄ ?i��K����?�Unknown
�Host	LessEqual"Egradient_tape/sparse_categorical_crossentropy/clip_by_value/LessEqual(1�����L9@9�����L9@A�����L9@I�����L9@a��u^���>imJz���?�Unknown
`HostGatherV2"
GatherV2_1(13333338@93333338@A3333338@I3333338@a#N�pȹ�>i�+b���?�Unknown
�HostResourceApplyGradientDescent"-SGD/SGD/update_3/ResourceApplyGradientDescent(1fffff�7@9fffff�7@Afffff�7@Ifffff�7@a����t�>i�жK��?�Unknown
�HostReluGrad"+gradient_tape/sequential_4/dense_8/ReluGrad(1������7@9������7@A������7@I������7@a%˲4�/�>i^:}�;��?�Unknown
VHostSum"Sum_2(1ffffff5@9ffffff5@Affffff5@Iffffff5@a~�YE6�>ia�b��?�Unknown
ZHostArgMax"ArgMax(13333335@93333335@A3333335@I3333335@a)�EN�>irv�(���?�Unknown
�HostSum"1sparse_categorical_crossentropy/weighted_loss/Sum(1������4@9������4@A������4@I������4@a+<	i~�>i��v%���?�Unknown
�HostDataset"?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice(1fffff�2@9fffff�2@Afffff�2@Ifffff�2@aX[ߴ��>idG����?�Unknown
�HostResourceApplyGradientDescent"-SGD/SGD/update_2/ResourceApplyGradientDescent(133333�2@933333�2@A33333�2@I33333�2@aHb˽��>i)�[����?�Unknown
�HostCast"BArithmeticOptimizer/ReorderCastLikeAndValuePreserving_float_Cast_1(1������2@9������2@A������2@I������2@a��eA²�>i�`���?�Unknown
�HostBiasAddGrad"6gradient_tape/sequential_4/dense_9/BiasAdd/BiasAddGrad(1     �0@9     �0@A     �0@I     �0@a�$b�?��>iW@ �/��?�Unknown
eHost
LogicalAnd"
LogicalAnd(1333333.@9333333.@A333333.@I333333.@al�Ǽ�>i��J��?�Unknown�
tHostAssignAddVariableOp"AssignAddVariableOp(1������-@9������-@A������-@I������-@am�ԟ���>i򧫋e��?�Unknown
qHostSigmoid"sequential_4/dense_9/Sigmoid(1������+@9������+@A������+@I������+@aǉ#�0��>il�R~��?�Unknown
l HostIteratorGetNext"IteratorGetNext(1������)@9������)@A������)@I������)@a� d�)�>iz|]|���?�Unknown
u!HostFlushSummaryWriter"FlushSummaryWriter(1333333&@9333333&@A333333&@I333333&@a���!��>i_%j���?�Unknown�
�"HostResourceApplyGradientDescent"-SGD/SGD/update_1/ResourceApplyGradientDescent(1������%@9������%@A������%@I������%@a�k�l<d�>iY��μ��?�Unknown
�#HostBiasAddGrad"6gradient_tape/sequential_4/dense_8/BiasAdd/BiasAddGrad(1������%@9������%@A������%@I������%@a�k�l<d�>iS��2���?�Unknown
�$HostDataset"AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor(1333333%@9333333@A333333%@I333333@a)�EN�>i\DF;���?�Unknown
v%HostAssignAddVariableOp"AssignAddVariableOp_2(1������$@9������$@A������$@I������$@a�`��>isa�����?�Unknown
|&HostAssignAddVariableOp"SGD/SGD/AssignAddVariableOp(1������#@9������#@A������#@I������#@a��:����>i�3���?�Unknown
�'HostGreaterEqual"Hgradient_tape/sparse_categorical_crossentropy/clip_by_value/GreaterEqual(1������#@9������#@A������#@I������#@a�B����>i��F��?�Unknown
�(HostCast"bsparse_categorical_crossentropy/ArithmeticOptimizer/ReorderCastLikeAndValuePreserving_int64_Cast_1(1       @9       @A       @I       @a��{l��>i����'��?�Unknown
�)HostReadVariableOp"+sequential_4/dense_9/BiasAdd/ReadVariableOp(1333333@9333333@A333333@I333333@a���+��>i�G�5��?�Unknown
�*HostMinimum"5sparse_categorical_crossentropy/clip_by_value/Minimum(1333333@9333333@A333333@I333333@a���+��>iU)��C��?�Unknown
X+HostEqual"Equal(1������@9������@A������@I������@as0@tT�>iuc9�O��?�Unknown
�,Host
Reciprocal"8gradient_tape/sparse_categorical_crossentropy/Reciprocal(1ffffff@9ffffff@Affffff@Iffffff@aɃNLf��>i���[��?�Unknown
X-HostCast"Cast_2(1������@9������@A������@I������@av*k����>i҇�g��?�Unknown
t.HostLog"#sparse_categorical_crossentropy/Log(1������@9������@A������@I������@av*k����>i�v�r��?�Unknown
b/HostDivNoNan"div_no_nan_1(1333333@9333333@A333333@I333333@a�}yԛ��>iEpD�}��?�Unknown
�0HostMaximum"-sparse_categorical_crossentropy/clip_by_value(1ffffff@9ffffff@Affffff@Iffffff@a&�ݼ�>i��P���?�Unknown
v1HostAssignAddVariableOp"AssignAddVariableOp_4(1333333@9333333@A333333@I333333@a)�EN�>i8�we���?�Unknown
�2HostDivNoNan"3sparse_categorical_crossentropy/weighted_loss/value(1333333@9333333@A333333@I333333@a)�EN�>i�����?�Unknown
X3HostCast"Cast_3(1ffffff@9ffffff@Affffff@Iffffff@a�e%�qP�>iO����?�Unknown
�4HostSigmoidGrad"6gradient_tape/sequential_4/dense_9/Sigmoid/SigmoidGrad(1������@9������@A������@I������@a�B����>i��"ެ��?�Unknown
v5HostAssignAddVariableOp"AssignAddVariableOp_3(1333333@9333333@A333333@I333333@a0k��>i�;�����?�Unknown
`6HostDivNoNan"
div_no_nan(1������@9������@A������@I������@a��L%*�>i��,!���?�Unknown
s7HostReadVariableOp"SGD/Cast/ReadVariableOp(1ffffff@9ffffff@Affffff@Iffffff@afNi�Hr�>ii��}���?�Unknown
v8HostAssignAddVariableOp"AssignAddVariableOp_1(1ffffff@9ffffff@Affffff@Iffffff@akB�۳J�>iY�kP���?�Unknown
�9HostMul"1gradient_tape/sparse_categorical_crossentropy/mul(1������	@9������	@A������	@I������	@av*k����>it+N���?�Unknown
�:HostReadVariableOp"+sequential_4/dense_8/BiasAdd/ReadVariableOp(1������	@9������	@A������	@I������	@av*k����>i��0����?�Unknown
w;HostReadVariableOp"div_no_nan/ReadVariableOp_1(1      @9      @A      @I      @a�w�\ы�>i�%1���?�Unknown
a<HostIdentity"Identity(1ffffff@9ffffff@Affffff@Iffffff@a&�ݼ�>i�0+8���?�Unknown�
y=HostReadVariableOp"div_no_nan_1/ReadVariableOp_1(1ffffff@9ffffff@Affffff@Iffffff@a&�ݼ�>i&`1?���?�Unknown
X>HostCast"Cast_1(1������@9������@A������@I������@a�k�l<d�>ie{@���?�Unknown
�?HostReadVariableOp"*sequential_4/dense_8/MatMul/ReadVariableOp(1������@9������@A������@I������@a�k�l<d�>i��O����?�Unknown
�@HostReadVariableOp"*sequential_4/dense_9/MatMul/ReadVariableOp(1������@9������@A������@I������@a�k�l<d�>i�^����?�Unknown
wAHostReadVariableOp"div_no_nan_1/ReadVariableOp(1������@9������@A������@I������@a�`��>i)�vu���?�Unknown
TBHostMul"Mul(1������ @9������ @A������ @I������ @a��L%*�>i�\�:���?�Unknown
uCHostReadVariableOp"div_no_nan/ReadVariableOp(1������ @9������ @A������ @I������ @a��L%*�>i�������?�Unknown