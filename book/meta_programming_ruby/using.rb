# coding:utf-8

def using(r)
  begin
    yield
  ensure
    r.dispose
  end
end

