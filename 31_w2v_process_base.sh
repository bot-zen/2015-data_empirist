W2V_THREADS=${W2V_THREADS:-4}
export W2V_THREADS

export DATA_NAME
DATA_NAME_EXT=".txt"

export W2V_SIZE=500 
export W2V_WINDOW=10 
export W2V_SAMPLE=1e-5 
export W2V_HS=0 
export W2V_NEGATIVE=15 
export W2V_ITER=5 

export W2V_MINCOUNT

function experiment01 {
    W2V_ALPHA=0.025 W2V_CBOW=0 ./30_w2v_process_data.sh <(cat tmp/w2v-1_${DATA_NAME}${DATA_NAME_EXT})
    W2V_ALPHA=0.05  W2V_CBOW=1 ./30_w2v_process_data.sh <(cat tmp/w2v-1_${DATA_NAME}${DATA_NAME_EXT})
}

DATA_NAME="empirist"
for W2V_MINCOUNT in 2 3 5
do
    experiment01
done

DATA_NAME="de.wikipedia.org"
for W2V_MINCOUNT in 25 50 100
do
    experiment01
done
