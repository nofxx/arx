require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../lib/arch/pkgbuild.rb')

describe Arch::Pkgbuild do
  PKGBUILD =  File.expand_path(File.dirname(__FILE__) + '/../../fixtures/pkgs/basic/matahari/PKGBUILD')
  PKGBUILD_TWO =  File.expand_path(File.dirname(__FILE__) + '/../../fixtures/pkgs/complex/rtorrent/PKGBUILD')

  describe "PKGBUILD Parse easy stuff" do

    before(:each) do
      @pb = Arch::Pkgbuild.new(PKGBUILD)
    end
      
    it "should find and read the file" do
      @pb.should be_instance_of(Arch::Pkgbuild)
    end

    it "should get bash env" do
      @pb.bash_env.should match(/pkgname/) #eql(1)
    end

    it "should get the pkg name" do
      @pb.pkgname.should eql("matahari")
    end

    it "should parse the pkgver" do
      @pb.pkgver.should eql("0.1.25")
    end

    it "should parse the pkgrel" do
      @pb.pkgrel.should eql(1)
    end

    it "should parse the pkgdesc" do
      @pb.pkgdesc.should eql("'A reverse HTTP shell to execute commands on remote machines behind firewalls.'")
    end

    it "should parse architecture" do
      @pb.should be_x32
      @pb.should be_x64
    end

    it "should get the url" do
      @pb.url.should eql("http://matahari.sourceforge.net")
    end

    it "should parse the license" do
      @pb.license.should eql(["GPL"])
    end

    it "should get the source" do
      @pb.source.should eql(['http://downloads.sourceforge.net/matahari/matahari-v0.1.25.tar.gz'])
    end

    it "should parse dependencies" do
      @pb.depends.should eql(["python"])
    end
    
    it "should parse provides" do
      @pb.provides.should eql(["matahari"])
    end
    
    it "should parse conflicts" do
      @pb.conflicts.should eql(["matahari"])
    end

  end

  describe "PKGBUILD Test more" do

    before(:each) do
      @pb = Arch::Pkgbuild.new(PKGBUILD_TWO)
    end
      
    it "should get the pkg name" do
      @pb.pkgname.should eql("rtorrent")
    end

    it "should parse the pkgver" do
      @pb.pkgver.should eql("0.8.2")
    end

    it "should parse the pkgrel" do
      @pb.pkgrel.should eql(2)
    end

    it "should parse the pkgdesc" do
      @pb.pkgdesc.should eql("'Ncurses BitTorrent client based on libTorrent'")
    end

    it "should parse architecture" do
      @pb.should be_x32
      @pb.should be_x64
    end

    it "should get the url" do
      @pb.url.should eql("http://libtorrent.rakshasa.no")
    end

    it "should parse the license" do
      @pb.license.should eql(["GPL"])
    end

    it "should get the source" do
      @pb.source.should eql(['http://libtorrent.rakshasa.no/downloads/rtorrent-0.8.2.tar.gz',
        "gcc4.3.patch"])
    end

    it "should parse the install" do
      @pb.install.should eql("rtorrent.install")
    end

    it "should parse dependencies" do
      @pb.depends.should eql(["libtorrent>=0.12.2", "curl>=7.12.0"])
    end
    
    it "should parse provides" do
      @pb.provides.should be_nil
    end
    
    it "should parse conflicts" do
      @pb.conflicts.should be_nil
    end


  end

end
