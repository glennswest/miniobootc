FROM registry.redhat.io/rhel9/rhel-bootc 
USER root
RUN dnf install -y sssd
RUN useradd minio-user
EXPOSE 9000
RUN dnf install -y https://dl.min.io/server/minio/release/linux-amd64/archive/minio-20240510014138.0.0-1.x86_64.rpm
COPY autopart.sh .
COPY run.sh .
