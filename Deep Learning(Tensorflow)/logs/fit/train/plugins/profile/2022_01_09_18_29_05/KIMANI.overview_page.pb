�	>yX��k�@>yX��k�@!>yX��k�@	��qH'@��qH'@!��qH'@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$>yX��k�@V-�t�@A�C�l��|@Y��s��c@*����� A)      �=2F
Iterator::ModelV}��b�^@!I��=6P@)�HP��^@1<��=�4P@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap33333�P@!��ẋA@)��ڊ��P@1o�0t�A@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatj�t��?!Aً��6�?)��e��a�?1گ�(?Y�?:Preprocessing2U
Iterator::Model::ParallelMapV2333333�?!��0�jD�?)333333�?1��0�jD�?:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip؁sF��P@!n�����A@)HP�sע?1�?���?:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice�ݓ��Z�?!�W��m�?)�ݓ��Z�?1�W��m�?:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor�g��s��?!8Kɶ^�v?)�g��s��?18Kɶ^�v?:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
both�Your program is MODERATELY input-bound because 11.6% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*high2t54.8 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9��qH'@>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	V-�t�@V-�t�@!V-�t�@      ��!       "      ��!       *      ��!       2	�C�l��|@�C�l��|@!�C�l��|@:      ��!       B      ��!       J	��s��c@��s��c@!��s��c@R      ��!       Z	��s��c@��s��c@!��s��c@JCPU_ONLYY��qH'@b Y      Y@q5�C��TM@"�	
both�Your program is MODERATELY input-bound because 11.6% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"T
Rtensorflow_stats (identify the time-consuming operations executed on the CPU_ONLY)"Z
Xtrace_viewer (look at the activities on the timeline of each CPU_ONLY in the trace view)*�
�<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2�
=type.googleapis.com/tensorflow.profiler.GenericRecommendation�
nohigh"t54.8 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.:
Refer to the TF2 Profiler FAQb�58.6632% of Op time on the host used eager execution. Performance could be improved with <a href="https://www.tensorflow.org/guide/function" target="_blank">tf.function.</a>2"CPU: B 