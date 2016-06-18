W2V_THREADS=${W2V_THREADS:-4}
export W2V_THREADS

export DATA_NAME
DATA_NAME="decow14ax"

export W2V_SIZE=500 
export W2V_WINDOW=10 
export W2V_SAMPLE=1e-5 
export W2V_HS=0 
export W2V_NEGATIVE=15 
export W2V_ITER=5 

export W2V_MINCOUNT
export W2V_MINCOUNT=100

. 10_w2v_prep_data

set +e
W2V_ALPHA=0.025 W2V_CBOW=0 ./30_w2v_process_data.sh \
<(zcat ../decow14ax/decow14ax*.xml.gz | cut -f1 | sed -e 's/^<s .*>$/<s>/' | sed -e 's/<\/[^s].*>//' -e 's/<[^s\/].*>//' | grep -vE '^$' | clean )

echo "Copy the .voc file (and avoid re-processing the input with identical output.)"
read -rsp $'Press any key to continue...\n' -n1 key

W2V_ALPHA=0.05  W2V_CBOW=1 W2V_READ_VOCAB="yes" ./30_w2v_process_data.sh \
<(zcat ../decow14ax/decow14ax*.xml.gz | cut -f1 | sed -e 's/^<s .*>$/<s>/' | sed -e 's/<\/[^s].*>//' -e 's/<[^s\/].*>//' | grep -vE '^$' | clean )
