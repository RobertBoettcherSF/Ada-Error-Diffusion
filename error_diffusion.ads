-- error_diffusion.ads
package Error_Diffusion is
   type Pixel is range 0 .. 255;
   type Algorithm_Type is (Floyd_Steinberg, Stucki, Jarvis_Judice_Ninke);
   
   -- Representing a grayscale image
   type Image_Matrix is array (Positive range <>, Positive range <>) of Float;
   
   -- Errors and exceptions
   Invalid_Dimensions : exception;
   Invalid_Algorithm  : exception;

   -- Main entry point
   procedure Diffuse_Image (
      Input_Image : in Image_Matrix;
      Output_Image : out Image_Matrix;
      Algorithm    : in Algorithm_Type
   );

end Error_Diffusion;
