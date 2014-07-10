class Object < BasicObject
  include Kernel

  ARGF = ARGF
  ARGV = []
  ArgumentError = ArgumentError
  Array = Array
  BasicObject = BasicObject
  Bignum = Bignum
  Binding = Binding
  CROSS_COMPILING = nil
  Class = Class
  Comparable = Comparable
  Complex = Complex
  Config = RbConfig
  Data = Data
  Date = Date
  DateTime = DateTime
  Dir = Dir
  ENV = {"PATH"=>"/home/bls/.rbenv/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/bls/bin:/usr/local/java/jdk1.8.0_05/bin:/home/bls/bin:/usr/local/java/jdk1.8.0_05/bin", "XAUTHORITY"=>"/home/bls/.Xauthority", "XDG_DATA_DIRS"=>"/usr/share/ubuntu:/usr/share/gnome:/usr/local/share/:/usr/share/", "GDMSESSION"=>"ubuntu", "MANDATORY_PATH"=>"/usr/share/gconf/ubuntu.mandatory.path", "COMPIZ_CONFIG_PROFILE"=>"ubuntu", "JAVA_HOME"=>"/usr/local/java/jdk1.8.0_05", "TEXTDOMAINDIR"=>"/usr/share/locale/", "XFILESEARCHPATH"=>"/usr/dt/app-defaults/%L/Dt", "XDG_CONFIG_DIRS"=>"/etc/xdg/xdg-ubuntu:/etc/xdg", "LANG"=>"en_US.UTF-8", "GNOME_KEYRING_CONTROL"=>"/run/user/bls/keyring-nsEHRc", "DBUS_SESSION_BUS_ADDRESS"=>"unix:abstract=/tmp/dbus-QL5PJxm0lQ,guid=dce112124ac279cc700ceebf53bced3b", "XDG_SEAT_PATH"=>"/org/freedesktop/DisplayManager/Seat0", "DEFAULTS_PATH"=>"/usr/share/gconf/ubuntu.default.path", "XDG_CURRENT_DESKTOP"=>"Unity", "DISPLAY"=>":0.0", "SSH_AGENT_PID"=>"1863", "SESSION_MANAGER"=>"local/ubuntu:@/tmp/.ICE-unix/1728,unix/ubuntu:/tmp/.ICE-unix/1728", "LOGNAME"=>"bls", "PWD"=>"/home/bls/Downloads/Aptana_Studio_3", "SHELL"=>"/bin/bash", "APTANA_VERSION"=>"3.4.2.1368863613", "UBUNTU_MENUPROXY"=>"libappmenu.so", "GPG_AGENT_INFO"=>"/run/user/bls/keyring-nsEHRc/gpg:0:1", "DESKTOP_SESSION"=>"ubuntu", "USER"=>"bls", "GNOME_DESKTOP_SESSION_ID"=>"this-is-deprecated", "SSH_AUTH_SOCK"=>"/run/user/bls/keyring-nsEHRc/ssh", "GTK_MODULES"=>"overlay-scrollbar", "XDG_SESSION_PATH"=>"/org/freedesktop/DisplayManager/Session0", "TEXTDOMAIN"=>"im-config", "NLSPATH"=>"/usr/dt/lib/nls/msg/%L/%N.cat", "XDG_SESSION_COOKIE"=>"f0e8a1a218bae4fed8286dd053baccea-1404890426.894496-1420837346", "XDG_RUNTIME_DIR"=>"/run/user/bls", "HOME"=>"/home/bls", "SHLVL"=>"1", "GNOME_KEYRING_PID"=>"1717"}
  EOFError = EOFError
  Encoding = Encoding
  EncodingError = EncodingError
  Enumerable = Enumerable
  Enumerator = Enumerator
  Errno = Errno
  Etc = Etc
  Exception = Exception
  FALSE = false
  FalseClass = FalseClass
  Fiber = Fiber
  FiberError = FiberError
  File = File
  FileTest = FileTest
  FileUtils = FileUtils
  Fixnum = Fixnum
  Float = Float
  FloatDomainError = FloatDomainError
  GC = GC
  Gem = Gem
  Hash = Hash
  IO = IO
  IOError = IOError
  IndexError = IndexError
  Integer = Integer
  Interrupt = Interrupt
  Kernel = Kernel
  KeyError = KeyError
  LoadError = LoadError
  LocalJumpError = LocalJumpError
  Marshal = Marshal
  MatchData = MatchData
  Math = Math
  Method = Method
  Module = Module
  Mutex = Mutex
  NIL = nil
  NameError = NameError
  NilClass = NilClass
  NoMemoryError = NoMemoryError
  NoMethodError = NoMethodError
  NotImplementedError = NotImplementedError
  Numeric = Numeric
  OUTPUT_PATH = "/home/bls/Internship/dry_cleaning/.metadata/.plugins/com.aptana.ruby.core/-1709340833/4/"
  Object = Object
  ObjectSpace = ObjectSpace
  Proc = Proc
  Process = Process
  Psych = Psych
  RUBY_COPYRIGHT = "ruby - Copyright (C) 1993-2012 Yukihiro Matsumoto"
  RUBY_DESCRIPTION = "ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-linux]"
  RUBY_ENGINE = "ruby"
  RUBY_PATCHLEVEL = 194
  RUBY_PLATFORM = "x86_64-linux"
  RUBY_RELEASE_DATE = "2012-04-20"
  RUBY_REVISION = 35410
  RUBY_VERSION = "1.9.3"
  Random = Random
  Range = Range
  RangeError = RangeError
  Rational = Rational
  RbConfig = RbConfig
  Regexp = Regexp
  RegexpError = RegexpError
  RubyVM = RubyVM
  RuntimeError = RuntimeError
  STDERR = IO.new
  STDIN = IO.new
  STDOUT = IO.new
  ScanError = StringScanner::Error
  ScriptError = ScriptError
  SecurityError = SecurityError
  Signal = Signal
  SignalException = SignalException
  StandardError = StandardError
  StopIteration = StopIteration
  String = String
  StringIO = StringIO
  StringScanner = StringScanner
  Struct = Struct
  Syck = Syck
  Symbol = Symbol
  SyntaxError = SyntaxError
  SystemCallError = SystemCallError
  SystemExit = SystemExit
  SystemStackError = SystemStackError
  TOPLEVEL_BINDING = #<Binding:0x00000001ed8fb8>
  TRUE = true
  TSort = TSort
  Thread = Thread
  ThreadError = ThreadError
  ThreadGroup = ThreadGroup
  Time = Time
  TrueClass = TrueClass
  TypeError = TypeError
  URI = URI
  UnboundMethod = UnboundMethod
  YAML = Psych
  ZeroDivisionError = ZeroDivisionError
  Zlib = Zlib

  def self.yaml_tag(arg0)
  end


  def psych_to_yaml(arg0, arg1, *rest)
  end

  def to_yaml(arg0, arg1, *rest)
  end

  def to_yaml_properties
  end


  protected


  private

  def dir_names(arg0)
  end

  def file_name(arg0)
  end

  def get_classes
  end

  def grab_instance_method(arg0, arg1)
  end

  def print_args(arg0)
  end

  def print_instance_method(arg0, arg1)
  end

  def print_method(arg0, arg1, arg2, arg3, arg4, *rest)
  end

  def print_type(arg0)
  end

  def print_value(arg0)
  end

end
