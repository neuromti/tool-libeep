import com.antneuro.libeep;

public class WriteCNT {
  public static void main(String[] args) {
    System.out.printf("libeep version: %s\n", com.antneuro.libeep.get_version());
    for(String filename : args) {
      // channels
      int channel_count = 16;
      int channel_info_handle   = com.antneuro.libeep.create_channel_info();
      for(int channel=0;channel<channel_count;++channel) {
        com.antneuro.libeep.add_channel(channel_info_handle, "chan" + channel, "ref", "uV");
      }
      // recording info
      int recording_info_handle = com.antneuro.libeep.create_recording_info();
      com.antneuro.libeep.set_start_time(recording_info_handle, System.currentTimeMillis()/1000, 0);
      // create file
      int cnt_handle            = com.antneuro.libeep.writeCnt(filename, 512, channel_info_handle, recording_info_handle);
      for(int sample = 0;sample<512;++sample) {
        com.antneuro.libeep.add_samples(cnt_handle, new float[10 * channel_count], 10);
      }
      com.antneuro.libeep.close(cnt_handle);
    }
  }
}
