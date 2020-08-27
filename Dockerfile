FROM centos:centos7
LABEL maintainer="ddeswart@vmware.com"

WORKDIR /tmp

RUN yum update -y && yum -y install \
    curl \
    wget \
    sshpass \
    unzip \
    git \
    nano \
    python \
    #Install Powershell
    curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo \
    yum update -y && yum -y install \
    powershell \
    #Cleanup image tmp dir
    rm -rf /tmp/*

# Install VMware modules from PSGallery
SHELL [ "pwsh", "-command" ]
RUN Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
RUN Install-Module VMware.PowerCLI
RUN Set-PowerCLIConfiguration -InvalidCertificateAction:ignore -Confirm:$false
CMD ["/bin/pwsh"]
    
ADD VERSION .
