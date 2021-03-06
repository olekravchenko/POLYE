DECLARE
   line f1,f2;
   bandx f3;
   garm p1;
   pol0 pi;
OMEGA
   w1=(f1 & f2) & f3;
   w=w1;
FUNCTION
   om=w; wx=dx(w1); wy=dy(w1);
   u0=ch(pi*x)*sin(pi*y); u2=p1;
   u1=w1*p1;
FUNCTION
   u=sum(1,u0,u1);
PROGRAM
   gil(s1,fa,fb);
   gil(s1,fa1);
   gil(s2,fa,fb);
   gil(s2,fa1);  
   gil(s3,fa,fb);
   gil(s3,fa1);  
   gil(s4,fa,fb);
   gil(s4,fa1); matr; time; paus; 
   sis(aa,bb); koef; time; paus;  
   isol(ssw,fu); 
   fa(u1)=u2(i,1)*(u1(j,2)*wx+u1(j,3)*wy); 
   fa1(u1)=u1(i,1)*(u2(j,2)*wx+u2(j,3)*wy);
   fb(u1)=(u2(i,2)*wx+u2(i,3)*wy)*u0 -
          (u0(2)*wx+u0(3)*wy)*u2(i,1);
   aa=ai(1); bb=bi(1);
   fu(u)=u;
fortran
        subroutine garm                                                         
c       �ணࠬ�� �ନ��� ��ମ���᪨� 
c       � ����ମ���᪨� ��������                                        
        implicit real*8(a-h,o-z)                                                
        common /array/ store(30000)                                                    
        common /par/ ir,iu,iv,m,n,nm,n1                                          
        common /r/ ir1,ir2                                                       
        common /rs/ ns,ix,iy,ihx,ihy                                             
        common /arg/ x,y                                                         
        common /ili/ ia(10)                                                       
        common /priz/ kol1,is2,is1
c
c        iy=0 - ��ମ���᪨� ��������
c        iy=1 - ����ମ���᪨� ��������
c 
c        ������� ���⮢�� ���祭�� ��� ���᫥���
c        ������⮢ ���ᨢ� ���.���⥦��
c
            a2=1.0                                                             
            b2=a2                                                                   
            a3=x                                                            
            b3=y                                                            

c        ������⢮ ��ମ���᪨� � ����ମ���᪨�
c        ��������� ��� �⥯��� N=ns-1
c        
            kol=2*ns-1
            if(iy.eq.1) kol=4*ns-6
c        
c        ����� ������� ���ᨢ� ���.���⥦�� 
c        � �� 㤢������ ���祭��
c 
            is2=m*(m+1)/2
            is1=2*is2           
c
c        ��饥 �᫮ ᫮� � ���ᨢ� ���.���⥦��
c
            kol1=kol*is2
c
c        ����� ����� ��� ࠧ��饭�� ���ᨢ�
c
            call give(kol1,1)
c
c        ���㫥��� ���ᨢ� ���.���⥦�� 
c
            do j=1,kol1
               store(ir1+j)=0.
            end do                                   
c
c        ������ ��������� � �� �ந�������
c
        juk=iy+1
        do kuk=1,juk
          ik=1+2*(kuk-1)
            do 400 i=ik,ns
              if (ik+1-i) 300,200,100
c             ������  ��ࢮ�� 童�� �鸞
 100            inx=ir1+(2*ns-1)*is2*(kuk-1)+1
                store(inx)=-y*y**(kuk-1)
c               �ந������
                if(m.ge.2) store(inx+2)=-2.*y*(kuk-1)   
                if(m.ge.3) store(inx+5)=-2.*(kuk-1)   
                go to 400
c             ������ ��ண� � ���쥣� 童�� �鸞
 200            inx=is2+inx
                iny=inx+is2                                                  
                store(inx)=x*((-3*y*y)**(kuk-1))                                                           
                store(iny)=y*((-y*y)**(kuk-1))
c               �ந������                                                     
                if(m.ge.2) then                                                   
                   store(inx+1)=(-3*y*y)**(kuk-1)                                                         
                   store(inx+2)=-6*x*y*(kuk-1)                                                         
                   store(iny+2)=(-3*y*y)**(kuk-1)
                end if
                  if(m.ge.3) then                                                   
                     store(inx+4)=-6*y*(kuk-1)                                                         
                     store(inx+5)=-6*x*(kuk-1)                                                         
                     store(iny+5)=-6*y*(kuk-1)
                  end if
                    if(m.ge.4) then                                                   
                       store(inx+8)=-6*(kuk-1)                                                         
                       store(iny+9)=-6*(kuk-1)
                    end if
                go to 400
c               ������ ��������� � �ந�������
c                 �� ४��७�� ��㫠�
 300            inx=iny+is2 
                iny=inx+is2
                kf=1+2*(kuk-1)/(ns-3)
                inx1=inx-is1                                                         
                inx2=inx-is2
                do j=1,m
c                  ���冷� �ந������� �� X
                   ipx=j-1
                   ix1=ipx-1 
                   m2=m-j+1
                   do k=1,m2
c                     ���冷� �ந������� �� Y
                      ipy=k-1               
                      iy1=ipy-1
c                     ���᫥��� �㭪樨 ���⠭����
c                        ��� ������� ���.���⥦� 
                      n1=num1(ipx,ipy)-1
                      n2=num1(ix1,ipy)-1
                      n3=num1(ipx,iy1)-1
c                     ���᫥��� ������⮢ ���.���⥦� ��
c                  ४��७�� ��㫠� �. �.�.�����७��
c                    "������ମ���᪨� ��������" �.76-77 
                      store(inx+n1)=kf*(a3*store(inx1+n1)-
     *                                   b3*store(inx2+n1)+ 
     *                                    ipx*store(inx1+n2)-
     *                                     ipy*store(inx2+n3))                                            
                      store(iny+n1)=a3*store(inx2+n1)+
     *                               b3*store(inx1+n1)+ 
     *                                ipx*store(inx2+n2)+
     *                                 ipy*store(inx1+n3)
                   end do
                end do                                              
 400        continue 
       end do                                                         
       call ttrg                                                             
       return
       end                                           
   
        subroutine ttrg                                                         
c               �롮ઠ ��ମ���᪨� � 
c              ����ମ���᪨� ���������                                      
        implicit real*8(a-h,o-z)                                                
        common /array/ store(30000)                                                    
        common /par/ ir,iu,iv,m,n,nm,n1                                          
        common /r/ ir1,ir2                                                       
        common /rs/ ns,ix,iy,ihx,ihy                                             
        common /priz/ kol1,is2,is1
c         ��ࠪ�� �⭮�� ��������� �� X � �� Y
c            ihx (ihy)=1..........�� 
c            ihx (ihy)=2..........��
c            ihx (ihy)=3..........����
c
          irx=0 
c            �� �� X � �� Y
          if(ihx+ihy.eq.2) then
             do j=1,kol1
                store(ir+j)=store(ir1+j)
             end do
             return
          end if
c          �롮ઠ
          jk=iy+1
          do kk=1,jk 
          iadrx=0 + (kk-1)*(2*ns-1)*is2
          iadry=iadrx+is2 + (kk-1)*(2*ns-1)*is2
             if(ihx.ne.3.and.ihy.ne.3) then                              
c               ������ ��ࢮ�� 童�� �鸞
c                  1 - ��� ��ମ���᪨�
c               -y*y - ��� ����ମ���᪨�
                do j=1,is2
                   store(ir+irx+j)=store(ir1+iadrx+j)
                end do
                irx=irx+is2
                iadrx=iadrx+3*is2
             else
                iadrx=iadrx+3*is2
             end if
c              ��ॡ�� �⥯���� ��������
               ll=2+(kk-1)*2   
               do i=ll,ns
                  if((-1)**(i-1).eq.1) go to 10
c                      �⥯��� �������� ���⭠�
                       if(ihx.eq.ihy) go to 20
                            if(ihx.eq.2.or.ihy-ihx.eq.2) then
c                              �ࠢ�
                               iadry=iadry+is2
                               istep=3
                            else
c                              ����
                               istep=4
                            end if     
                         do j=1,is2
                            store(ir+irx+j)=store(ir1+iadry+j)
                         end do
                         irx=irx+is2
                         iadry=iadry+istep*is2
                       go to 20
 10                    continue  
c                      �⥯��� �������� �⭠�
                       if(ihx+ihy.eq.5) go to 20
                          if(ihy.ne.2.and.ihx.ne.2) then
c                              �ࠢ�
                             iadrx=iadrx+is2
                             istep=3
                          else
c                              ����
                             istep=4
                          end if     
                       do j=1,is2
                          store(ir+irx+j)=store(ir1+iadrx+j)
                       end do
                       irx=irx+is2
                       iadrx=iadrx+istep*is2
 20               continue              
               end do
          end do
          return
          end
   
        function nms(k,ir)                                                        
c         ����� ���ᨢ� ����७樠����                                         
c                   ���⥦��                                       
c          k - ����� ��������                                                   
c          ir - ��ࠦ���� ����                                                  
c                  min0(ihx,ihy)*ik-i                                           
c          ik - ������⢮ �ਡ�������                                         
c          i - ����� �ਡ�������                                            
      implicit real*8 (a-h,o-z)                                                 
      common /rs/ ns,ix,iy,ihx,ihy                                              
      if (ix.eq.0) go to 200                                         
      ns=ns-ir                                                                  
      if(ns) 100,100,101                                                        
100   ns=1                                                                      
101   continue                                                                  
      nm=0                                                                      
c         ���᫥��� ����� ���ᨢ� ����७樠����                                              
c         ���⥦�� ��� �������� � ����ᨬ��� ��                                     
c         ��࡮� �⥯���� � ����� �ਡ�������                               
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
c     ������⢮ ��ମ���᪨� � ����ମ���᪨� ���������
      nm=0                                  
          if(ihx+ihy.eq.2) then
             nms=2*ns-1
             if(iy.eq.1) nms=4*ns-6 
             return
          end if
          jk=iy+1
          do kk=1,jk
             if(ihx.ne.3.and.ihy.ne.3) nm=nm+1
             ll=2+(kk-1)*2                               
               do i=ll,ns
                  if((-1)**(i-1).eq.1) go to 510
c                      �⥯��� �������� ���⭠�
                       if(ihx.eq.ihy) go to 520
                             nm=nm+1
                       go to 520
 510                    continue  
c                      �⥯��� �������� �⭠�
                       if(ihx+ihy.eq.5) go to 520
                           nm=nm+1
 520               continue              
               end do
           end do
           nms=nm
           return                                                                  
           end                                                                       
       function num1(i11,i12)
         i1=abs(i11)
         i2=abs(i12)
         num1=(i1+i2)*(i1+i2+1)/2 + i2 + 1
       return
       end
end                                                                       
VALUE
   const=1,1,1,2,120,1,1;
   tabl=n1,0,0,2,3, 0,1,1,0,1;
   n1=10; 
   f1=-1,1,-1,-1; f2=1,-1,1,1;
   f3=0,1; f4=0,0,1; f5=0,0,4;
   p1=1,0.,0.,1.; 
   ssw=10,10,-1,-1,1,1; s5=k,0,0,1,0,360;
   s1=k,1,1,-1,1;   s2=k,-1,1,-1,-1;
   s3=k,-1,-1,1,-1; s4=k,1,-1,1,1;
   k=1;
   pi=3.141592653;
END
