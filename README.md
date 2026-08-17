# Error Diffusion Implementation in Ada

## Project Overview
This project implements the Error Diffusion algorithm in Ada, a technique used in computer graphics to digitize images by distributing quantization errors to neighboring pixels.

## Features
- **Algorithm Variants:** Supports selection of Floyd-Steinberg, Stucki, and Jarvis-Judice-Ninke (JJN).
- **Strong Typing:** Utilizes Ada's type system to ensure safe image data manipulation.
- **Robustness:** Includes boundary checking and error accumulation logic.

## Testing
The test suite (`tests.adb`) performs V&V (Verification and Validation):
- **Verification:** Ensures the mathematical implementation of error kernels matches requirements.
- **Validation:** Ensures the software handles edge cases (e.g., mismatched dimensions, empty matrices) without crashing.
- **Assumption Testing:** Tests are designed assuming the code is "broken" to prove stability through assertions.

## Usage
### Compilation
Ensure you have `gnat` installed. From the root directory:
```bash
make
