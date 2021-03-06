/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* cells_not_processed =  1  *)
(* src = "paralelo_serial_synth.v:1" *)
module paralelo_serial_synth(clk_4f, clk_32f, data_in, valid_in, reset, data2send, data_out);
  (* src = "paralelo_serial_synth.v:33" *)
  wire [7:0] _000_;
  (* src = "paralelo_serial_synth.v:33" *)
  wire _001_;
  (* src = "paralelo_serial_synth.v:33" *)
  wire [2:0] _002_;
  (* src = "paralelo_serial_synth.v:33" *)
  wire [2:0] _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  (* src = "paralelo_serial_synth.v:4" *)
  input clk_32f;
  (* src = "paralelo_serial_synth.v:3" *)
  input clk_4f;
  (* src = "paralelo_serial_synth.v:8" *)
  output [7:0] data2send;
  (* src = "paralelo_serial_synth.v:5" *)
  input [7:0] data_in;
  (* src = "paralelo_serial_synth.v:9" *)
  output data_out;
  (* src = "paralelo_serial_synth.v:7" *)
  input reset;
  (* src = "paralelo_serial_synth.v:11" *)
  wire [2:0] selector1;
  (* src = "paralelo_serial_synth.v:12" *)
  wire [2:0] selector2;
  (* src = "paralelo_serial_synth.v:6" *)
  input valid_in;
  NOT _068_ (
    .A(selector2[2]),
    .Y(_014_)
  );
  NOT _069_ (
    .A(selector2[0]),
    .Y(_015_)
  );
  NOT _070_ (
    .A(selector1[1]),
    .Y(_016_)
  );
  NOT _071_ (
    .A(selector1[2]),
    .Y(_017_)
  );
  NOT _072_ (
    .A(valid_in),
    .Y(_018_)
  );
  NOT _073_ (
    .A(reset),
    .Y(_019_)
  );
  NOT _074_ (
    .A(data_in[0]),
    .Y(_020_)
  );
  NOT _075_ (
    .A(data_in[1]),
    .Y(_021_)
  );
  NOT _076_ (
    .A(data_in[6]),
    .Y(_022_)
  );
  NAND _077_ (
    .A(selector1[0]),
    .B(valid_in),
    .Y(_023_)
  );
  NOR _078_ (
    .A(selector1[0]),
    .B(valid_in),
    .Y(_024_)
  );
  NAND _079_ (
    .A(valid_in),
    .B(_019_),
    .Y(_025_)
  );
  NAND _080_ (
    .A(_019_),
    .B(_023_),
    .Y(_026_)
  );
  NOR _081_ (
    .A(_024_),
    .B(_026_),
    .Y(_002_[0])
  );
  NOR _082_ (
    .A(_016_),
    .B(_023_),
    .Y(_027_)
  );
  NAND _083_ (
    .A(_016_),
    .B(_023_),
    .Y(_028_)
  );
  NAND _084_ (
    .A(_019_),
    .B(_028_),
    .Y(_029_)
  );
  NOR _085_ (
    .A(_027_),
    .B(_029_),
    .Y(_002_[1])
  );
  NAND _086_ (
    .A(selector1[2]),
    .B(_027_),
    .Y(_030_)
  );
  NOR _087_ (
    .A(selector1[2]),
    .B(_027_),
    .Y(_031_)
  );
  NOR _088_ (
    .A(reset),
    .B(_031_),
    .Y(_032_)
  );
  NAND _089_ (
    .A(_030_),
    .B(_032_),
    .Y(_033_)
  );
  NOT _090_ (
    .A(_033_),
    .Y(_002_[2])
  );
  NOR _091_ (
    .A(_020_),
    .B(_025_),
    .Y(_000_[0])
  );
  NOR _092_ (
    .A(_021_),
    .B(_025_),
    .Y(_000_[1])
  );
  NOR _093_ (
    .A(_018_),
    .B(data_in[2]),
    .Y(_034_)
  );
  NOR _094_ (
    .A(reset),
    .B(_034_),
    .Y(_000_[2])
  );
  NOR _095_ (
    .A(_018_),
    .B(data_in[3]),
    .Y(_035_)
  );
  NOR _096_ (
    .A(reset),
    .B(_035_),
    .Y(_000_[3])
  );
  NOR _097_ (
    .A(_018_),
    .B(data_in[4]),
    .Y(_036_)
  );
  NOR _098_ (
    .A(reset),
    .B(_036_),
    .Y(_000_[4])
  );
  NOR _099_ (
    .A(_018_),
    .B(data_in[5]),
    .Y(_037_)
  );
  NOR _100_ (
    .A(reset),
    .B(_037_),
    .Y(_000_[5])
  );
  NOR _101_ (
    .A(_022_),
    .B(_025_),
    .Y(_000_[6])
  );
  NOR _102_ (
    .A(_018_),
    .B(data_in[7]),
    .Y(_038_)
  );
  NOR _103_ (
    .A(reset),
    .B(_038_),
    .Y(_000_[7])
  );
  NOR _104_ (
    .A(_015_),
    .B(valid_in),
    .Y(_039_)
  );
  NAND _105_ (
    .A(_015_),
    .B(valid_in),
    .Y(_040_)
  );
  NAND _106_ (
    .A(_019_),
    .B(_040_),
    .Y(_041_)
  );
  NOR _107_ (
    .A(_039_),
    .B(_041_),
    .Y(_003_[0])
  );
  NAND _108_ (
    .A(selector2[1]),
    .B(_039_),
    .Y(_042_)
  );
  NOR _109_ (
    .A(selector2[1]),
    .B(_039_),
    .Y(_043_)
  );
  NOR _110_ (
    .A(reset),
    .B(_043_),
    .Y(_044_)
  );
  NAND _111_ (
    .A(_042_),
    .B(_044_),
    .Y(_045_)
  );
  NOT _112_ (
    .A(_045_),
    .Y(_003_[1])
  );
  NOR _113_ (
    .A(_014_),
    .B(_042_),
    .Y(_046_)
  );
  NAND _114_ (
    .A(_014_),
    .B(_042_),
    .Y(_047_)
  );
  NAND _115_ (
    .A(_019_),
    .B(_047_),
    .Y(_048_)
  );
  NOR _116_ (
    .A(_046_),
    .B(_048_),
    .Y(_003_[2])
  );
  NOR _117_ (
    .A(selector1[2]),
    .B(data_in[7]),
    .Y(_049_)
  );
  NOR _118_ (
    .A(_017_),
    .B(data_in[3]),
    .Y(_050_)
  );
  NOR _119_ (
    .A(_049_),
    .B(_050_),
    .Y(_051_)
  );
  NOR _120_ (
    .A(selector1[0]),
    .B(_051_),
    .Y(_052_)
  );
  NOR _121_ (
    .A(selector1[2]),
    .B(_022_),
    .Y(_053_)
  );
  NAND _122_ (
    .A(selector1[2]),
    .B(data_in[2]),
    .Y(_054_)
  );
  NAND _123_ (
    .A(selector1[0]),
    .B(_054_),
    .Y(_055_)
  );
  NOR _124_ (
    .A(_053_),
    .B(_055_),
    .Y(_056_)
  );
  NOR _125_ (
    .A(_052_),
    .B(_056_),
    .Y(_057_)
  );
  NOR _126_ (
    .A(selector1[1]),
    .B(_057_),
    .Y(_058_)
  );
  NOR _127_ (
    .A(selector1[2]),
    .B(data_in[5]),
    .Y(_059_)
  );
  NOR _128_ (
    .A(_017_),
    .B(data_in[1]),
    .Y(_060_)
  );
  NOR _129_ (
    .A(_059_),
    .B(_060_),
    .Y(_061_)
  );
  NOR _130_ (
    .A(selector1[0]),
    .B(_061_),
    .Y(_062_)
  );
  NAND _131_ (
    .A(selector1[2]),
    .B(data_in[0]),
    .Y(_063_)
  );
  NOT _132_ (
    .A(_063_),
    .Y(_064_)
  );
  NAND _133_ (
    .A(_017_),
    .B(data_in[4]),
    .Y(_065_)
  );
  NAND _134_ (
    .A(selector1[0]),
    .B(_065_),
    .Y(_066_)
  );
  NOR _135_ (
    .A(_064_),
    .B(_066_),
    .Y(_067_)
  );
  NOR _136_ (
    .A(_062_),
    .B(_067_),
    .Y(_004_)
  );
  NOR _137_ (
    .A(_016_),
    .B(_004_),
    .Y(_005_)
  );
  NOR _138_ (
    .A(_058_),
    .B(_005_),
    .Y(_006_)
  );
  NOR _139_ (
    .A(_018_),
    .B(_006_),
    .Y(_007_)
  );
  NOR _140_ (
    .A(selector2[2]),
    .B(selector2[1]),
    .Y(_008_)
  );
  NAND _141_ (
    .A(selector2[0]),
    .B(_008_),
    .Y(_009_)
  );
  NAND _142_ (
    .A(selector2[2]),
    .B(selector2[1]),
    .Y(_010_)
  );
  NAND _143_ (
    .A(_009_),
    .B(_010_),
    .Y(_011_)
  );
  NAND _144_ (
    .A(_018_),
    .B(_011_),
    .Y(_012_)
  );
  NAND _145_ (
    .A(_019_),
    .B(_012_),
    .Y(_013_)
  );
  NOR _146_ (
    .A(_007_),
    .B(_013_),
    .Y(_001_)
  );
  (* src = "paralelo_serial_synth.v:33" *)
  DFF _147_ (
    .C(clk_32f),
    .D(_001_),
    .Q(data_out)
  );
  (* src = "paralelo_serial_synth.v:33" *)
  DFF _148_ (
    .C(clk_32f),
    .D(_002_[0]),
    .Q(selector1[0])
  );
  (* src = "paralelo_serial_synth.v:33" *)
  DFF _149_ (
    .C(clk_32f),
    .D(_002_[1]),
    .Q(selector1[1])
  );
  (* src = "paralelo_serial_synth.v:33" *)
  DFF _150_ (
    .C(clk_32f),
    .D(_002_[2]),
    .Q(selector1[2])
  );
  (* src = "paralelo_serial_synth.v:33" *)
  DFF _151_ (
    .C(clk_32f),
    .D(_003_[0]),
    .Q(selector2[0])
  );
  (* src = "paralelo_serial_synth.v:33" *)
  DFF _152_ (
    .C(clk_32f),
    .D(_003_[1]),
    .Q(selector2[1])
  );
  (* src = "paralelo_serial_synth.v:33" *)
  DFF _153_ (
    .C(clk_32f),
    .D(_003_[2]),
    .Q(selector2[2])
  );
  (* src = "paralelo_serial_synth.v:33" *)
  DFF _154_ (
    .C(clk_32f),
    .D(_000_[0]),
    .Q(data2send[0])
  );
  (* src = "paralelo_serial_synth.v:33" *)
  DFF _155_ (
    .C(clk_32f),
    .D(_000_[1]),
    .Q(data2send[1])
  );
  (* src = "paralelo_serial_synth.v:33" *)
  DFF _156_ (
    .C(clk_32f),
    .D(_000_[2]),
    .Q(data2send[2])
  );
  (* src = "paralelo_serial_synth.v:33" *)
  DFF _157_ (
    .C(clk_32f),
    .D(_000_[3]),
    .Q(data2send[3])
  );
  (* src = "paralelo_serial_synth.v:33" *)
  DFF _158_ (
    .C(clk_32f),
    .D(_000_[4]),
    .Q(data2send[4])
  );
  (* src = "paralelo_serial_synth.v:33" *)
  DFF _159_ (
    .C(clk_32f),
    .D(_000_[5]),
    .Q(data2send[5])
  );
  (* src = "paralelo_serial_synth.v:33" *)
  DFF _160_ (
    .C(clk_32f),
    .D(_000_[6]),
    .Q(data2send[6])
  );
  (* src = "paralelo_serial_synth.v:33" *)
  DFF _161_ (
    .C(clk_32f),
    .D(_000_[7]),
    .Q(data2send[7])
  );
endmodule
