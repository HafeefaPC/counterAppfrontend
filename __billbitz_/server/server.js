console.log("=== Node.js Receipt OCR Demo - Need help? Email support@asprise.com ===");

const express = require('express');
const bodyParser = require('body-parser');
const request = require('request');
const fs = require('fs');

const app = express();
const port = 3000;

// Middleware to parse JSON bodies
app.use(bodyParser.json());

app.post('/processImage', (req, res) => {
    // Get base64-encoded image data from the request body
    const base64Image = req.body.base64Image;
    console.log("Received image data length: " + base64Image.length);
    console.log("Received image data: " + base64Image.substring(0, 50) + "...");

    // Define OCR endpoint URL
    const receiptOcrEndpoint = 'https://ocr.asprise.com/api/v1/receipt';

    // Prepare OCR request data
    const formData = {
        client_id: 'TEST',
        recognizer: 'auto',
        ref_no: 'ocr_nodejs_123',
        file: {
            value: Buffer.from(base64Image, 'base64'), // Convert base64 to buffer
            options: {
                filename: 'image.jpg',
                contentType: 'image/jpeg'
            }
        }
    };

    // Send OCR request
    request.post({ url: receiptOcrEndpoint, formData: formData }, (error, response, body) => {
        if (error) {
            console.error(error);
            res.status(500).send('Error occurred while processing image.');
        } else {
            // Parse OCR result
            const ocrResult = JSON.parse(body);
            // Extract text from OCR result
            const extractedText = extractTextFromOCRResult(ocrResult);
            // Log extracted text in the terminal
            console.log("Extracted text from image:", extractedText);
            
            res.status(200).send(body);
        }
    });
});

function extractTextFromOCRResult(ocrResult) {
  
    return "Text extracted from OCR result";
}

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
