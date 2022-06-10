FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app/

## Step 2:
# Copy source code to working directory
COPY Makefile /app/Makefile
COPY requirements.txt /app/requirements.txt

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --no-cache-dir --upgrade pip &&\
		pip install --no-cache-dir -r requirements.txt

COPY . /app
# COPY app.py /app/
# COPY README.md /app/
# COPY run_docker.sh /app/
# COPY upload_docker.sh /app/
# COPY run_kubernetes.sh /app/
# COPY .circleci/ /app/.circleci/
# COPY model_data/ /app/model_data
# COPY output_txt_files/ /app/output_txt_files
# COPY make_prediction.sh /app/make_prediction.sh

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD [ "python3", "app.py"]
