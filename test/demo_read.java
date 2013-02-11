import com.antneuro.libeep;

public class demo_read {
  public static void main(String[] args) {
    System.out.printf("libeep version: %s\n", com.antneuro.libeep.get_version());
    for(String filename : args) {
      int handle=com.antneuro.libeep.read(filename);
      if(handle!=-1) {
        System.out.printf("data file: %s\n", filename);
        System.out.printf("  sample frequency: %s\n", com.antneuro.libeep.get_sample_frequency(handle));
        System.out.printf("  sample count: %s\n", com.antneuro.libeep.get_sample_count(handle));
        System.out.printf("  channels:");
        for(int n=0;n<com.antneuro.libeep.get_channel_count(handle);n++) {
          System.out.printf(" chan(%s, %s, %s)",
            com.antneuro.libeep.get_channel_label(handle, n),
            com.antneuro.libeep.get_channel_unit(handle, n),
            com.antneuro.libeep.get_channel_reference(handle, n)
          );
        }
        System.out.println();
        System.out.printf("  samples:");
        float[] sample0=com.antneuro.libeep.get_samples(handle, 0, 1);
        for(int n=0;n<com.antneuro.libeep.get_channel_count(handle);n++) {
          System.out.printf(" %f", sample0[n]);
        }
        System.out.println();
        com.antneuro.libeep.close(handle);
      }
    }
  }
}
