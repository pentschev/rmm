set -e

if [ "$BUILD_LIBRMM" == '1' ]; then
  echo "Building librmm"
  CUDA_REL=${CUDA:0:3}
  if [ "${CUDA:0:2}" == '10' ]; then
    # CUDA 10 release
    CUDA_REL=${CUDA:0:4}
  fi

  conda build conda/recipes/librmm -c nvidia/label/cuda${CUDA_REL} -c rapidsai/label/cuda${CUDA_REL} -c rapidsai-nightly/label/cuda${CUDA_REL} -c conda-forge --python=$PYTHON
fi
