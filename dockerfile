FROM debian:7-slim

ENV terra_url https://releases.hashicorp.com/terraform/0.11.11/
ENV terra_file terraform_0.11.11_linux_amd64.zip

RUN 	apt-get update -y && \
	apt-get install maven -y

RUN 	apt-get install -y unzip wget && \
	wget $terra_url$terra_file && \
	unzip $terra_file && \
	rm $terra_file -f && \	
	mv terraform /usr/local/bin/ && \
	apt-get remove -y unzip wget && apt-get autoremove -y && apt-get autoclean

RUN 	apt-get install -y apt-transport-https lsb-release software-properties-common \
	gnupg python-pip && \
	echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | \
	tee /etc/apt/sources.list.d/azure-cli.list &&\
	apt-key --keyring /etc/apt/trusted.gpg.d/Microsoft.gpg adv \
     	--keyserver packages.microsoft.com \
     	--recv-keys BC528686B50D79E339D3721CEB3E94ADBE1229CF && \
	apt-get update -y && \
	apt-get install -y azure-cli openssl jq && pip install databricks-cli && \
	apt-get remove -y apt-transport-https lsb-release \
	software-properties-common gnupg python-pip && apt-get autoremove -y && apt-get autoclean

##RUN apt-get install 
RUN apt-get install -y  python3
##RUN  apt-get autoremove && apt-get autoclean 
