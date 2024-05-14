FROM registry.redhat.io/rhel9/rhel-bootc 
EXPOSE 9000
RUN dnf install -y https://dl.min.io/server/minio/release/linux-amd64/archive/minio-20240510014138.0.0-1.x86_64.rpm
RUN groupadd -r minio-user
RUN useradd -M -r -g minio-user minio-user
RUN mkdir /mnt
RUN COPY autopart.sh .
RUN COPY run.sh .

chown minio-user:minio-user /mnt/disk1 /mnt/disk2 /mnt/disk3 /mnt/disk4

RUN service MinIO enable
RUN service MinIO start
