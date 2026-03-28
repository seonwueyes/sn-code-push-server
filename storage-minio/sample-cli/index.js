import fs from 'fs';
import { Client } from 'minio';

const minioClient = new Client({
  endPoint: '127.0.0.1',
  port: 9000,
  useSSL: false,
  accessKey: 'RcAExwD8vb0Yu9FYtonC',
  secretKey: 'nUaVRuLOf3P4U1eSeo6MpMP10SYsaop5Kwnlf25Z',
});

// 버킷이 존재하는지 확인하는 함수
async function checkBucket() {
  const bucketName = 'my-bucket';

  try {
    const exists = await minioClient.bucketExists(bucketName);
    if (exists) {
      console.log(`Bucket "${bucketName}" exists.`);
    } else {
      console.log(`Bucket "${bucketName}" does not exist.`);
    }
  } catch (error) {
    console.error('Error checking bucket:', error);
  }
}

// 파일을 MinIO에 업로드하는 함수
async function uploadFile() {
  const bucketName = 'my-bucket';
  const objectName = 'example.txt';
  const filePath = './upload-files/local-file.txt'; // 로컬 파일 경로

  try {
    // 버킷이 없으면 생성
    const exists = await minioClient.bucketExists(bucketName);
    if (!exists) {
      await minioClient.makeBucket(bucketName, 'us-east-1');
      console.log(`Bucket "${bucketName}" created.`);
    }

    // 파일 업로드
    await minioClient.fPutObject(bucketName, objectName, filePath);
    console.log(`File "${objectName}" uploaded to bucket "${bucketName}"`);
  } catch (error) {
    console.error('Error uploading file:', error);
  }
}

// MinIO에서 파일을 다운로드하는 함수
async function downloadFile() {
  const bucketName = 'my-bucket';
  const objectName = 'example.txt'; // 다운로드할 파일 이름
  const downloadPath = './download-files/downloaded-file.txt'; // 다운로드 받을 경로

  try {
    // 파일 다운로드
    await minioClient.fGetObject(bucketName, objectName, downloadPath);
    console.log(`File "${objectName}" downloaded to "${downloadPath}"`);
  } catch (error) {
    console.error('Error downloading file:', error);
  }
}

console.log('check Bucket ...');
await checkBucket();

console.log('upload ...');
await uploadFile();

console.log('download ...');
await downloadFile();
