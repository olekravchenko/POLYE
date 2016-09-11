DECLARE
   circl f1,f2;
   garm p1;
   pol0 r1,r2;
OMEGA
   w1=f1;
   w2=f2;
   w=w2;
FUNCTION
   om=w; wx1=dx(w1); wy1=dy(w1);
   pp1=p1; u0=1;
   u1=om*pp1;
FUNCTION
   u=sum(1,u0,u1);
PROGRAM
   predi(w1);
   gic(s1,fa,fb);
   sis(a,b);
   predi(w2);
   rezult(ssw,fu);
   fa(u1)=(u1(j,2)*wx1+u1(j,3)*wy1)*pp1(i,1) -
          (pp1(i,2)*wx1+pp1(i,3)*wy1)*u1(i,1);
   fb(u1)=(pp1(i,2)*wx1+pp1(i,3)*wy1)*u0;
   a=ai(1); b=bi(1);
   fu(u)=u;
fortran
        subroutine garm
c               ƒapmohˆ—eckˆe o‹ˆhom›
        implicit real*8(a-h,o-z)
        common /array/ st(1)
        common /par/ir,iu,iv,m,n,nm,n1
        common /r/ir1,ir2
        common /rs/ns,ix,iy,ihx,ihy
        common /arg/x,y
        common /ili/ia(1)
        common /arg1/a2,b2,a3,b3,nl,indx
        common /priz/ip,is2,is1
        call give((ns*2-1)*m,1)
        rad=st(iu+4)
        a=st(iu+2)
        b=st(iu+3)
        a2=1.0/rad
        b2=a2
        a3=(x-a)/rad
        b3=(y-b)/rad
        is2=m*(m+1)/2
        is1=is2*2
        kn=2
        if(ns.lt.1) kn=1
          do 10 i=1,kn
          indx=is1*(i-1)+ir1+1
          indy=indx+is2
            do 20 j=1,is2
            st(indx+j-1)=0.0
20          st(indy+j-1)=0.0
          if(i.eq.2) go to 21
c               e„ˆhˆ–a
          st(indx)=1.0
          st(indy)=1.0
          go to 10
c               x ˆ y
21        st(indx)=a3
          st(indy)=b3
          if(m.lt.2) go to 10
c               poˆ‡bo„h›e
          st(indx+1)=a2
          st(indy+2)=b2
10        continue
        if(ns.lt.3) go to 120
        indx=is1+indx
        ip=0
        nl=3
        call prgarm
120     call ttrg
        return
        end
      function nms(k,ir)
c         „‹ˆha maccˆba „ˆ””epeh–ˆa‹œh›x
c                   kopte†e‰
c          k - homep o‹ˆhoma
c          ir - b›pa†ehˆe bˆ„a
c                  min0(ihx,ihy)*ik-i
c          ik - ko‹ˆ—ectbo pˆ‹ˆ†ehˆ‰
c          i - homep pˆ‹ˆ†ehˆŸ
      implicit real*8 (a-h,o-z)
      common /rs/ ns,ix,iy,ihx,ihy
      if (ix.eq.0.and.iy.eq.0) goto 200
      if (ix.eq.0.and.iy.eq.1) goto 300
      ns=ns-ir
      if(ns) 100,100,101
100   ns=1
101   continue
      nm=0
c         b›—ˆc‹ehˆe „‹ˆh› maccˆba
c         „ˆ””epeh–ˆa‹œh›x kopte†e‰
c         „‹Ÿ o‹ˆhoma b ‡abˆcˆmoctˆ
c         ot epeopa cteehe‰ ˆ
c         homepa pˆ‹ˆ†ehˆŸ
1     do 30 j2=1,ns
      if(j2-iy) 30,2,2
2     do 20 j=iy,j2,ihy
      if(j2-ix) 20,3,3
3     do 10 i=ix,j2,ihx
      if(i+j-j2-1) 10,4,10
4     nm=nm+1
10    continue
20    continue
30    continue
      nms=nm
      return
200   continue
c ko‹ˆ—ectbo ƒapmohˆ—eckˆx o‹ˆhomob
      if(ihx+ihy.eq.2) go to 40
      if(ihx.eq.2.and.ihy.eq.2) go to 50
      if(ihx+ihy.gt.4) go to 50
c ka†„›‰ btopo‰
      nms=ns
      return
   40 nms=(ns-1)*2+1
      return
   50 nms=1
      ih=3
      ish=2
      if(ihx.eq.ihy) ih=2
      do 60 i=ih,ns,ish
   60 nms=nms+1
      return
300   continue
c  ko‹ˆ—ectbo ˆƒapmohˆ—eckˆx o‹ˆhomob
      if(ihx+ihy.eq.2) goto 70
      if(ihx+ihy.gt.4) goto 80
      if(ihx.eq.2.and.ihy.eq.2) goto 80
c  ka†„›‰ btopo‰:21,12,13,31
      if(ihx+ihy.eq.3) nms=ns*2-2
      if(ihx+ihy.eq.4) nms=ns*2-3
      return
c bce
70    nms=ns*4-6
      if(ns.lt.3) nms=ns*2-1
      return
c  22,33,23,32
80    nms=1
      ih=2
      if(ihx.eq.ihy) ih=3
          do 90 i=ih,ns,2
90        nms=nms+2
      if(ihx.eq.3.or.ihy.eq.3) nms=nms-1
      return
      end
        subroutine per(irr,iadr,is)
c               epeˆcœ ‹emehtob maccˆba
        implicit real*8(a-h,o-z)
        common /array/st(1)
          do 100 j=1,is
100       st(irr+j)=st(iadr+j)
        irr=irr+is
        return
        end
        subroutine prgarm
c               poˆ‡bo„h›e ˆ o‹ˆhom›
        implicit real*8(a-h,o-z)
        common /array/ st(1)
        common /par/ir,iu,iv,m,n,nm,n1
        common /r/ir1,ir2
        common /rs/ns,ix,iy,ihx,ihy
        common /arg/x,y
        common /ili/ia(1)
        common /arg1/a2,b2,a3,b3,nl,indx
        common /priz/ip,is2,is1
c               ip=0-ƒapm,   ip=1-bˆƒapm.
        kf=1
           do 30 i=nl,ns
           indy=indx+is2
           if(ip.eq.1) kf=(i-1)/(i-3)
c               o‹ˆhom›
           ix1=indx-is1
           ix2=indx-is2
        st(indx)=kf*(a3*st(ix1)-b3*st(ix2))
        st(indy)=a3*st(ix2)+b3*st(ix1)
c               poˆ‡bo„h›e
          j=m
          l1=indx-is1
          l2=indx-is2
             do 32 k=1,m
             k1=k-1
             k2=k-2
             fl7=k1*b2
                do 33 l=1,j
                if(k.eq.1.and.l.eq.1) go to 33
                kl1=ia(k1+l)
                kl2=ia(k2+l)
                kl3=kl1+k1
                kl4=kl2+k1
                kl5=kl2+k2
                fl6=(l-1)*a2
                indxy=indx+kl3
                indx1=indxy-is1
                indx2=l1+kl4
                indx3=l2+kl3
                indx4=l2+kl5
        st(indxy)=kf*(a3*st(indx1)-b3*st(indx3)+
     *  fl6*st(indx2)-fl7*st(indx4))
                indxy=indy+kl3
                indy1=indxy-is1
                indy2=l2+kl4
                indy3=l1+kl3
                indy4=l1+kl5
        st(indxy)=a3*st(indy1)+b3*st(indy3)+
     *  fl6*st(indy2)+fl7*st(indy4)
33              continue
32           j=j-1
          indx=indy+is2
30        continue
        return
        end
        subroutine ttrg
c               b›opka ƒapmohˆ—.o‹ˆhomob
        implicit real*8(a-h,o-z)
        common /array/ st(1)
        common /par/ir,iu,iv,m,n,nm,n1
        common /r/ir1,ir2
        common /rs/ns,ix,iy,ihx,ihy
        common /priz/ip,is2,is1
c               ip=0-ƒapm,   ip=1-ˆƒapm.
        irr=ir
        iadr=ir1+is2
c 1
        call per(irr,iadr,is2)
        if(ihx+ihy.eq.2) go to 20
c               b›opka
        ish=1
        ih=2
        if(ihx.eq.ihy) go to 40
        if(ihx+ihy.gt.4) go to 41
50        do 60 i=ih,ns,ish
c               adr „‹Ÿ ƒapm
          iadr=ir1+is1*(i-1)
c               adr „‹Ÿ ˆƒapm
          iadr1=ir2+is1*(i-3)
          if((i/2)*2.eq.i) go to 70
c               i-he—ethoe
          if(ihx.ne.3.and.ihy.ne.3) go to 90
c               pab›‰ ˆ‡ ƒapm.
          iadr=iadr+is2
          call per(irr,iadr,is2)
          if(ip.ne.1) go to 60
          if(i.lt.5) go to 60
c               pab›‰ ˆ‡ ˆƒapm.
          iadr1=iadr1+is2
          call per(irr,iadr1,is2)
          go to 60
c               i-—ethoe
70        if(ihx.ne.2.and.ihy.ne.3) go to 90
c               pab›‰ ˆ‡ ƒapm.
          iadr=iadr+is2
          call per(irr,iadr,is2)
          if(ip.ne.1) go to 60
          if(i.lt.4) go to 60
c               pab›‰ ˆ‡ ˆƒapm.
          iadr1=iadr1+is2
          call per(irr,iadr1,is2)
          go to 60
c               ‹eb›‰ ˆ‡ ƒapm.
90        call per(irr,iadr,is2)
          if(ip.ne.1) go to 60
          if(i.lt.3) go to 60
c               ‹eb›‰ ˆ‡ ˆƒapm.
          call per(irr,iadr1,is2)
60        continue
        return
40      ih=3
41      ish=2
        go to 50
c               bce
20         do 30 i=2,ns
           iadr=ir1+is1*(i-1)
           iadr1=ir2+is1*(i-3)
c               epeˆcœ ƒapm.
           call per(irr,iadr,is1)
           if(ip.ne.1) go to 30
           if(i.eq.2) go to 30
c               epeˆcœ ˆƒapm.
           is=is1
           if(i.eq.3) is=is2
           call per(irr,iadr1,is)
30         continue
        return
        end
end
VALUE
   const=1,1,1,2,50,1,1;
   tabl=n1,0,0,1,1,0,1,1,0,1;
   n1=6;
        f1=0,0,r1;
        f2=0,0,r2;
   p1=1,0,0,r2;
   ssw=30,PR;
   s1=k,0,0,r2,0,360;
   pr=-r2,-r2,r2,r2;
   r1=3; r2=4; k=1;
END
